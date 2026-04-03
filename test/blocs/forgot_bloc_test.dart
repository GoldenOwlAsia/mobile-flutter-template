import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/src/features/authentication/logic/forgot_bloc.dart';
import 'package:myapp/src/features/authentication/model/email_fromz.dart';
import 'package:myapp/src/network/data/sign/sign_repository.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:myapp/src/network/model/common/result.dart';

class MockDomainManager extends Mock implements DomainManager {}

class MockSignRepository extends Mock implements SignRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ForgotBloc forgotBloc;
  late MockDomainManager mockDomainManager;
  late MockSignRepository mockSignRepository;

  setUp(() {
    mockDomainManager = MockDomainManager();
    mockSignRepository = MockSignRepository();

    when(() => mockDomainManager.sign).thenReturn(mockSignRepository);

    forgotBloc = ForgotBloc(mockDomainManager);
  });

  tearDown(() {
    forgotBloc.close();
  });

  group('ForgotBloc', () {
    test('initial state is ForgotState', () {
      expect(forgotBloc.state, equals(const ForgotState()));
    });

    group('onEmailChanged', () {
      blocTest<ForgotBloc, ForgotState>(
        'emits state with updated email (pure)',
        build: () => forgotBloc,
        act: (bloc) => bloc.onEmailChanged('test@example.com'),
        expect: () => [
          const ForgotState(email: EmailFormzInput.pure('test@example.com')),
        ],
      );
    });

    group('onSubmitForgotPassword', () {
      blocTest<ForgotBloc, ForgotState>(
        'does nothing when email is invalid',
        build: () => forgotBloc,
        act: (bloc) => bloc.onSubmitForgotPassword(),
        expect: () => <ForgotState>[],
      );

      blocTest<ForgotBloc, ForgotState>(
        'does nothing when status is in progress',
        build: () {
          forgotBloc.emit(
            forgotBloc.state.copyWith(status: FormzSubmissionStatus.inProgress),
          );
          return forgotBloc;
        },
        act: (bloc) => bloc.onSubmitForgotPassword(),
        expect: () => <ForgotState>[],
      );

      blocTest<ForgotBloc, ForgotState>(
        'emits inProgress then success when request succeeds',
        setUp: () {
          when(
            () => mockSignRepository.forgotPassword('test@example.com'),
          ).thenAnswer((_) async => MResult.success('Success'));
        },
        seed: () =>
            const ForgotState(email: EmailFormzInput.pure('test@example.com')),
        build: () => forgotBloc,
        act: (bloc) => bloc.onSubmitForgotPassword(),
        expect: () => [
          const ForgotState(
            email: EmailFormzInput.pure('test@example.com'),
            status: FormzSubmissionStatus.inProgress,
          ),
          const ForgotState(
            email: EmailFormzInput.pure('test@example.com'),
            status: FormzSubmissionStatus.success,
          ),
        ],
        verify: (_) {
          verify(
            () => mockSignRepository.forgotPassword('test@example.com'),
          ).called(1);
        },
      );

      blocTest<ForgotBloc, ForgotState>(
        'emits inProgress then failure when request fails',
        setUp: () {
          when(
            () => mockSignRepository.forgotPassword('test@example.com'),
          ).thenAnswer((_) async => MResult.error('Email not found'));
        },
        seed: () =>
            const ForgotState(email: EmailFormzInput.pure('test@example.com')),
        build: () => forgotBloc,
        act: (bloc) => bloc.onSubmitForgotPassword(),
        expect: () => [
          const ForgotState(
            email: EmailFormzInput.pure('test@example.com'),
            status: FormzSubmissionStatus.inProgress,
          ),
          const ForgotState(
            email: EmailFormzInput.pure('test@example.com'),
            status: FormzSubmissionStatus.failure,
            error: 'Email not found',
          ),
        ],
      );
    });
  });
}
