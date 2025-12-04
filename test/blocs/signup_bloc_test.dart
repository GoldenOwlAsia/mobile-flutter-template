import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/features/authentication/logic/signup_bloc.dart';
import 'package:myapp/src/features/authentication/model/email_fromz.dart';
import 'package:myapp/src/features/authentication/model/model_input.dart';
import 'package:myapp/src/features/authentication/model/name_formz.dart';
import 'package:myapp/src/network/data/sign/sign_repository.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:myapp/src/network/model/user/user.dart';

class MockDomainManager extends Mock implements DomainManager {}

class MockSignRepository extends Mock implements SignRepository {}

class MockAccountBloc extends Mock implements AccountBloc {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Register fallback values for mocktail
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

    // Register AccountBloc in GetIt for testing
    GetIt.instance.reset();
    GetIt.instance.registerFactory<AccountBloc>(() => mockAccountBloc);

    signupBloc = SignupBloc(mockDomainManager);
  });

  tearDown(() {
    signupBloc.close();
    GetIt.instance.reset();
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
          SignupState(
            email: EmailFormzInput.pure('test@example.com'),
          ),
        ],
      );

      blocTest<SignupBloc, SignupState>(
        'emits state with updated email (dirty)',
        build: () {
          signupBloc.onEmailChanged('initial@example.com');
          return signupBloc;
        },
        act: (bloc) => bloc.onEmailChanged('updated@example.com'),
        expect: () => [
          SignupState(
            email: EmailFormzInput.pure('updated@example.com'),
          ),
        ],
      );
    });

    group('onPasswordChanged', () {
      blocTest<SignupBloc, SignupState>(
        'emits state with updated password',
        build: () => signupBloc,
        act: (bloc) => bloc.onPasswordChanged('password123'),
        expect: () => [
          SignupState(
            password: PasswordFormzInput.dirty('password123'),
          ),
        ],
      );
    });

    group('onNameChanged', () {
      blocTest<SignupBloc, SignupState>(
        'emits state with updated name',
        build: () => signupBloc,
        act: (bloc) => bloc.onNameChanged('John Doe'),
        expect: () => [
          SignupState(
            name: NameFormzInput.dirty('John Doe'),
          ),
        ],
      );
    });

    group('signupWithEmail', () {
      blocTest<SignupBloc, SignupState>(
        'does nothing when status is in progress',
        build: () {
          signupBloc.emit(
            signupBloc.state.copyWith(
              status: FormzSubmissionStatus.inProgress,
            ),
          );
          return signupBloc;
        },
        act: (bloc) {
          final context = MockBuildContext();
          when(() => context.mounted).thenReturn(true);
          bloc.signupWithEmail(context);
        },
        expect: () => [],
      );

      blocTest<SignupBloc, SignupState>(
        'does nothing when form is not validated',
        build: () => signupBloc,
        act: (bloc) {
          final context = MockBuildContext();
          when(() => context.mounted).thenReturn(true);
          bloc.signupWithEmail(context);
        },
        expect: () => [],
      );

      // NOTE: Full success/failure flow tests are skipped because they require
      // static dependencies (AppCoordinator, XAlert, GetIt) that cannot be
      // easily mocked in unit tests. To properly test these flows, the bloc
      // should be refactored to inject these dependencies.
      //
      // The above blocTests verify:
      // - State validation (inProgress guard, form validation)
      // - Field change handlers (onEmailChanged, onPasswordChanged, onNameChanged)
      //
      // Integration tests should cover the full signup flow.
    });
  });
}
