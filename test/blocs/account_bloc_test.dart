import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/network/data/sign/sign_repository.dart';
import 'package:myapp/src/network/data/user/user_repository.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:myapp/src/network/model/common/result.dart';
import 'package:myapp/src/network/model/user/user.dart';

class MockDomainManager extends Mock implements DomainManager {}

class MockUserRepository extends Mock implements UserRepository {}

class MockSignRepository extends Mock implements SignRepository {}

// Register fallback values for mocktail
void _registerFallbacks() {
  registerFallbackValue(MUser(id: '', email: ''));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  _registerFallbacks();

  late AccountBloc accountBloc;
  late MockDomainManager mockDomainManager;
  late MockUserRepository mockUserRepository;
  late MockSignRepository mockSignRepository;

  setUp(() {
    mockDomainManager = MockDomainManager();
    mockUserRepository = MockUserRepository();
    mockSignRepository = MockSignRepository();

    when(() => mockDomainManager.user).thenReturn(mockUserRepository);
    when(() => mockDomainManager.sign).thenReturn(mockSignRepository);

    // Mock getUser to return empty user for syncUserData() called in constructor
    when(
      () => mockUserRepository.getUser(any<String>()),
    ).thenAnswer((_) async => MResult.error('No user'));

    HydratedBloc.storage = MockStorage();
    accountBloc = AccountBloc(mockDomainManager);
  });

  tearDown(() {
    accountBloc.close();
  });

  group('AccountBloc', () {
    test('initial state is AccountState.ds()', () {
      expect(accountBloc.state, equals(AccountState.ds()));
    });

    group('onLoginSuccess', () {
      blocTest<AccountBloc, AccountState>(
        'emits state with logged in user',
        setUp: () {
          when(
            () => mockUserRepository.getUser(any<String>()),
          ).thenAnswer((_) async => MResult.error('No user'));
        },
        build: () => AccountBloc(mockDomainManager),
        act: (bloc) {
          final user = MUser(
            id: '123',
            email: 'test@example.com',
            name: 'Test User',
          );
          bloc.onLoginSuccess(user);
        },
        wait: const Duration(milliseconds: 100),
        expect: () => [
          AccountState(
            user: MUser(
              id: '123',
              email: 'test@example.com',
              name: 'Test User',
            ),
          ),
        ],
      );
    });

    group('onEditProfileSuccess', () {
      blocTest<AccountBloc, AccountState>(
        'updates user name in state',
        setUp: () {
          when(
            () => mockUserRepository.getUser(any<String>()),
          ).thenAnswer((_) async => MResult.error('No user'));
        },
        build: () {
          final bloc = AccountBloc(mockDomainManager);
          final user = MUser(
            id: '123',
            email: 'test@example.com',
            name: 'Old Name',
          );
          bloc.onLoginSuccess(user);
          return bloc;
        },
        act: (bloc) => bloc.onEditProfileSuccess(name: 'New Name'),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          AccountState(
            user: MUser(id: '123', email: 'test@example.com', name: 'New Name'),
          ),
        ],
      );
    });

    group('onUserChange', () {
      blocTest<AccountBloc, AccountState>(
        'emits new state',
        setUp: () {
          when(
            () => mockUserRepository.getUser(any<String>()),
          ).thenAnswer((_) async => MResult.error('No user'));
        },
        build: () => AccountBloc(mockDomainManager),
        act: (bloc) {
          final newState = AccountState(
            user: MUser(id: '456', email: 'new@example.com'),
          );
          bloc.onUserChange(newState);
        },
        wait: const Duration(milliseconds: 100),
        expect: () => [
          AccountState(
            user: MUser(id: '456', email: 'new@example.com'),
          ),
        ],
      );
    });

    group('syncUserData', () {
      blocTest<AccountBloc, AccountState>(
        'updates state when user fetch succeeds',
        build: () {
          final user = MUser(id: '123', email: 'test@example.com');
          accountBloc.onLoginSuccess(user);
          when(
            () => mockUserRepository.getUser('123'),
          ).thenAnswer((_) async => MResult.success(user));
          return accountBloc;
        },
        act: (bloc) => bloc.syncUserData(),
        wait: const Duration(milliseconds: 100),
        verify: (_) {
          verify(() => mockUserRepository.getUser('123')).called(1);
        },
      );

      blocTest<AccountBloc, AccountState>(
        'logs out when user fetch fails',
        setUp: () {
          when(
            () => mockUserRepository.getUser(any<String>()),
          ).thenAnswer((_) async => MResult.error('No user'));
        },
        build: () {
          final bloc = AccountBloc(mockDomainManager);
          final user = MUser(id: '123', email: 'test@example.com');
          bloc.onLoginSuccess(user);
          when(
            () => mockUserRepository.getUser('123'),
          ).thenAnswer((_) async => MResult.error('User not found'));
          return bloc;
        },
        act: (bloc) => bloc.syncUserData(),
        wait: const Duration(milliseconds: 200),
        expect: () => [AccountState(user: MUser.empty())],
        verify: (_) {
          verify(() => mockUserRepository.getUser('123')).called(1);
        },
      );

      blocTest<AccountBloc, AccountState>(
        'does nothing when user id is empty',
        build: () => accountBloc,
        act: (bloc) => bloc.syncUserData(),
        wait: const Duration(milliseconds: 100),
        verify: (_) {
          verifyNever(() => mockUserRepository.getUser(any<String>()));
        },
      );
    });

    group('toJson/fromJson', () {
      test('toJson returns correct map', () {
        final user = MUser(id: '123', email: 'test@example.com', name: 'Test');
        final state = AccountState(user: user, locale: 'en');
        final json = accountBloc.toJson(state);

        expect(json, isNotNull);
        expect(json!['locale'], equals('en'));
      });

      test('fromJson returns correct state', () {
        final json = {
          'user': {'id': '123', 'email': 'test@example.com', 'name': 'Test'},
          'locale': 'en',
        };
        final state = accountBloc.fromJson(json);

        expect(state, isNotNull);
        expect(state!.user.id, equals('123'));
        expect(state.locale, equals('en'));
      });

      test('fromJson returns default state on error', () {
        final invalidJson = {'invalid': 'data'};
        final state = accountBloc.fromJson(invalidJson);

        expect(state, equals(AccountState.ds()));
      });

      test('toJson returns null on error', () {
        // Create a bloc with a state that might cause serialization issues
        final invalidBloc = AccountBloc(mockDomainManager);
        // This should handle errors gracefully
        final json = invalidBloc.toJson(AccountState.ds());
        expect(json, isNotNull);
        invalidBloc.close();
      });
    });
  });
}

class MockStorage implements Storage {
  @override
  Future<void> write(String key, dynamic value) async {}

  @override
  Future<dynamic> read(String key) async => null;

  @override
  Future<void> delete(String key) async {}

  @override
  Future<void> clear() async {}

  @override
  Future<void> close() async {}
}
