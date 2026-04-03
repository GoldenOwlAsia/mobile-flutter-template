import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/features/authentication/logic/signin_bloc.dart';
import 'package:myapp/src/features/authentication/model/email_fromz.dart';
import 'package:myapp/src/features/authentication/model/model_input.dart';
import 'package:myapp/src/network/data/sign/sign_repository.dart';
import 'package:myapp/src/network/data/user/user_repository.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:myapp/src/network/model/common/result.dart';
import 'package:myapp/src/network/model/user/user.dart';

class MockDomainManager extends Mock implements DomainManager {}

class MockSignRepository extends Mock implements SignRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockAccountBloc extends Mock implements AccountBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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

    signinBloc = SigninBloc(mockDomainManager, mockAccountBloc);
  });

  tearDown(() {
    signinBloc.close();
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
          const SigninState(email: EmailFormzInput.pure('test@example.com')),
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
          const SigninState(email: EmailFormzInput.pure('updated@example.com')),
        ],
      );
    });

    group('onPasswordChanged', () {
      blocTest<SigninBloc, SigninState>(
        'emits state with updated password',
        build: () => signinBloc,
        act: (bloc) => bloc.onPasswordChanged('password123'),
        expect: () => [
          const SigninState(password: PasswordFormzInput.dirty('password123')),
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
        expect: () => <SigninState>[],
      );

      blocTest<SigninBloc, SigninState>(
        'does nothing when form is not validated',
        build: () => signinBloc,
        act: (bloc) => bloc.loginWithEmail(),
        expect: () => <SigninState>[],
      );

      blocTest<SigninBloc, SigninState>(
        'emits success and notifies AccountBloc on successful login',
        setUp: () {
          when(
            () => mockSignRepository.loginWithEmail(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenAnswer(
            (_) async => MResult.success(MUser(id: '1', email: 'test@e.com')),
          );
          when(
            () => mockAccountBloc.onLoginSuccess(any()),
          ).thenReturn(null);
        },
        seed: () => const SigninState(
          email: EmailFormzInput.pure('test@e.com'),
          password: PasswordFormzInput.dirty('password123'),
        ),
        build: () => signinBloc,
        act: (bloc) => bloc.loginWithEmail(),
        expect: () => [
          isA<SigninState>()
              .having((s) => s.status, 'status', FormzSubmissionStatus.inProgress),
          isA<SigninState>()
              .having((s) => s.status, 'status', FormzSubmissionStatus.success),
        ],
        verify: (_) {
          verify(() => mockAccountBloc.onLoginSuccess(any())).called(1);
        },
      );

      blocTest<SigninBloc, SigninState>(
        'emits failure with message on failed login',
        setUp: () {
          when(
            () => mockSignRepository.loginWithEmail(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenAnswer(
            (_) async => MResult.error('Invalid credentials'),
          );
        },
        seed: () => const SigninState(
          email: EmailFormzInput.pure('test@e.com'),
          password: PasswordFormzInput.dirty('password123'),
        ),
        build: () => signinBloc,
        act: (bloc) => bloc.loginWithEmail(),
        expect: () => [
          isA<SigninState>()
              .having((s) => s.status, 'status', FormzSubmissionStatus.inProgress),
          isA<SigninState>()
              .having((s) => s.status, 'status', FormzSubmissionStatus.failure)
              .having((s) => s.message, 'message', 'Invalid credentials'),
        ],
      );
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
        expect: () => <SigninState>[],
      );
    });
  });
}
