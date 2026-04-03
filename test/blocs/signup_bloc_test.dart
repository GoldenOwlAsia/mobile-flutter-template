import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/features/authentication/logic/signup_bloc.dart';
import 'package:myapp/src/features/authentication/model/email_fromz.dart';
import 'package:myapp/src/features/authentication/model/model_input.dart';
import 'package:myapp/src/features/authentication/model/name_formz.dart';
import 'package:myapp/src/network/data/sign/sign_repository.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:myapp/src/network/model/common/result.dart';
import 'package:myapp/src/network/model/user/user.dart';

class MockDomainManager extends Mock implements DomainManager {}

class MockSignRepository extends Mock implements SignRepository {}

class MockAccountBloc extends Mock implements AccountBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(MUser(id: '', email: ''));
  });

  late SignupBloc signupBloc;
  late MockDomainManager mockDomainManager;
  late MockSignRepository mockSignRepository;
  late MockAccountBloc mockAccountBloc;

  setUp(() {
    mockDomainManager = MockDomainManager();
    mockSignRepository = MockSignRepository();
    mockAccountBloc = MockAccountBloc();

    when(() => mockDomainManager.sign).thenReturn(mockSignRepository);

    signupBloc = SignupBloc(mockDomainManager, mockAccountBloc);
  });

  tearDown(() {
    signupBloc.close();
  });

  group('SignupBloc', () {
    test('initial state is SignupState', () {
      expect(signupBloc.state, equals(const SignupState()));
    });

    group('onEmailChanged', () {
      blocTest<SignupBloc, SignupState>(
        'emits state with updated email (pure)',
        build: () => signupBloc,
        act: (bloc) => bloc.onEmailChanged('test@example.com'),
        expect: () => [
          const SignupState(email: EmailFormzInput.pure('test@example.com')),
        ],
      );
    });

    group('onPasswordChanged', () {
      blocTest<SignupBloc, SignupState>(
        'emits state with updated password',
        build: () => signupBloc,
        act: (bloc) => bloc.onPasswordChanged('password123'),
        expect: () => [
          const SignupState(password: PasswordFormzInput.dirty('password123')),
        ],
      );
    });

    group('onNameChanged', () {
      blocTest<SignupBloc, SignupState>(
        'emits state with updated name',
        build: () => signupBloc,
        act: (bloc) => bloc.onNameChanged('John Doe'),
        expect: () => [
          const SignupState(name: NameFormzInput.dirty('John Doe')),
        ],
      );
    });

    group('signupWithEmail', () {
      blocTest<SignupBloc, SignupState>(
        'does nothing when status is in progress',
        build: () {
          signupBloc.emit(
            signupBloc.state.copyWith(status: FormzSubmissionStatus.inProgress),
          );
          return signupBloc;
        },
        act: (bloc) => bloc.signupWithEmail(),
        expect: () => <SignupState>[],
      );

      blocTest<SignupBloc, SignupState>(
        'does nothing when form is not validated',
        build: () => signupBloc,
        act: (bloc) => bloc.signupWithEmail(),
        expect: () => <SignupState>[],
      );

      blocTest<SignupBloc, SignupState>(
        'emits success and notifies AccountBloc on successful signup',
        setUp: () {
          when(
            () => mockSignRepository.signUpWithEmail(
              email: any(named: 'email'),
              password: any(named: 'password'),
              name: any(named: 'name'),
            ),
          ).thenAnswer(
            (_) async => MResult.success(MUser(id: '1', email: 'test@e.com')),
          );
          when(
            () => mockAccountBloc.onLoginSuccess(any()),
          ).thenReturn(null);
        },
        seed: () => const SignupState(
          email: EmailFormzInput.pure('test@e.com'),
          password: PasswordFormzInput.dirty('password123'),
          name: NameFormzInput.dirty('Test User'),
        ),
        build: () => signupBloc,
        act: (bloc) => bloc.signupWithEmail(),
        expect: () => [
          isA<SignupState>()
              .having((s) => s.status, 'status', FormzSubmissionStatus.inProgress),
          isA<SignupState>()
              .having((s) => s.status, 'status', FormzSubmissionStatus.success),
        ],
        verify: (_) {
          verify(() => mockAccountBloc.onLoginSuccess(any())).called(1);
        },
      );

      blocTest<SignupBloc, SignupState>(
        'emits failure with message on failed signup',
        setUp: () {
          when(
            () => mockSignRepository.signUpWithEmail(
              email: any(named: 'email'),
              password: any(named: 'password'),
              name: any(named: 'name'),
            ),
          ).thenAnswer(
            (_) async => MResult.error('Email already exists'),
          );
        },
        seed: () => const SignupState(
          email: EmailFormzInput.pure('test@e.com'),
          password: PasswordFormzInput.dirty('password123'),
          name: NameFormzInput.dirty('Test User'),
        ),
        build: () => signupBloc,
        act: (bloc) => bloc.signupWithEmail(),
        expect: () => [
          isA<SignupState>()
              .having((s) => s.status, 'status', FormzSubmissionStatus.inProgress),
          isA<SignupState>()
              .having((s) => s.status, 'status', FormzSubmissionStatus.failure)
              .having((s) => s.message, 'message', 'Email already exists'),
        ],
      );
    });
  });
}
