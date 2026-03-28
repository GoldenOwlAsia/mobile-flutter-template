import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/features/authentication/logic/signin_bloc.dart';
import 'package:myapp/src/features/authentication/model/email_fromz.dart';
import 'package:myapp/src/features/authentication/model/model_input.dart';
import 'package:myapp/src/network/data/sign/sign_repository.dart';
import 'package:myapp/src/network/data/user/user_repository.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:myapp/src/network/model/user/user.dart';

class MockDomainManager extends Mock implements DomainManager {}

class MockSignRepository extends Mock implements SignRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockAccountBloc extends Mock implements AccountBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Register fallback values for mocktail
  registerFallbackValue(MUser(id: '', email: ''));

  late SigninBloc signinBloc;
  late MockDomainManager mockDomainManager;
  late MockSignRepository mockSignRepository;
  late MockUserRepository mockUserRepository;
  late MockAccountBloc mockAccountBloc;

  setUp(() {
    mockDomainManager = MockDomainManager();
    mockSignRepository = MockSignRepository();
    mockUserRepository = MockUserRepository();
    mockAccountBloc = MockAccountBloc();

    when(() => mockDomainManager.sign).thenReturn(mockSignRepository);
    when(() => mockDomainManager.user).thenReturn(mockUserRepository);

    // Register AccountBloc in GetIt for testing
    GetIt.instance.reset();
    GetIt.instance.registerFactory<AccountBloc>(() => mockAccountBloc);

    signinBloc = SigninBloc(mockDomainManager);
  });

  tearDown(() {
    signinBloc.close();
    GetIt.instance.reset();
  });

  group('SigninBloc', () {
    test('initial state is SigninState', () {
      expect(signinBloc.state, equals(const SigninState()));
    });

    group('onEmailChanged', () {
      blocTest<SigninBloc, SigninState>(
        'emits state with updated email (pure)',
        build: () => signinBloc,
        act: (bloc) => bloc.onEmailChanged('test@example.com'),
        expect: () => [
          SigninState(email: EmailFormzInput.pure('test@example.com')),
        ],
      );

      blocTest<SigninBloc, SigninState>(
        'emits state with updated email (dirty)',
        build: () {
          signinBloc.onEmailChanged('initial@example.com');
          return signinBloc;
        },
        act: (bloc) => bloc.onEmailChanged('updated@example.com'),
        expect: () => [
          SigninState(email: EmailFormzInput.pure('updated@example.com')),
        ],
      );
    });

    group('onPasswordChanged', () {
      blocTest<SigninBloc, SigninState>(
        'emits state with updated password',
        build: () => signinBloc,
        act: (bloc) => bloc.onPasswordChanged('password123'),
        expect: () => [
          SigninState(password: PasswordFormzInput.dirty('password123')),
        ],
      );
    });

    group('loginWithEmail', () {
      blocTest<SigninBloc, SigninState>(
        'does nothing when status is in progress',
        build: () {
          signinBloc.emit(
            signinBloc.state.copyWith(status: FormzSubmissionStatus.inProgress),
          );
          return signinBloc;
        },
        act: (bloc) => bloc.loginWithEmail(),
        expect: () => [],
      );

      blocTest<SigninBloc, SigninState>(
        'does nothing when form is not validated',
        build: () => signinBloc,
        act: (bloc) => bloc.loginWithEmail(),
        expect: () => [],
      );

      // NOTE: Full success/failure flow tests are skipped because they require
      // static dependencies (AppCoordinator, XAlert, GetIt) that cannot be
      // easily mocked in unit tests. To properly test these flows, the bloc
      // should be refactored to inject these dependencies.
      //
      // The above blocTests verify:
      // - State validation (inProgress guard, form validation)
      // - Field change handlers (onEmailChanged, onPasswordChanged)
      //
      // Integration tests should cover the full login flow.
    });

    group('loginWithGoogle', () {
      blocTest<SigninBloc, SigninState>(
        'does nothing when status is in progress',
        build: () {
          signinBloc.emit(
            signinBloc.state.copyWith(status: FormzSubmissionStatus.inProgress),
          );
          return signinBloc;
        },
        act: (bloc) => bloc.loginWithGoogle(),
        expect: () => [],
      );

      // NOTE: Full Google login flow tests are skipped - see comment above.
    });

    group('loginWithApple', () {
      // NOTE: Full Apple login flow tests are skipped - see comment above.
    });

    group('loginWithFacebook', () {
      // NOTE: Full Facebook login flow tests are skipped - see comment above.
    });
  });
}
