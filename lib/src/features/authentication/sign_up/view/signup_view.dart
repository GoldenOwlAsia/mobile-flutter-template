import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/src/core/localization/localization_utils.dart';
import 'package:myapp/src/core/widgets/button/button.dart';
import 'package:myapp/src/core/widgets/forms/input.dart';
import 'package:myapp/src/features/authentication/sign_up/cubit/signup_cubit.dart';
import 'package:myapp/src/features/authentication/widgets/sign_title.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<SignupCubit>(),
      child: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, SignupState state) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: _builder(context, state),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _builder(BuildContext context, SignupState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SignTitle('Sigup'),
        const SizedBox(height: 24.0),
        XInput(
          key: const Key('loginForm_NameInput_textField'),
          value: state.name.value,
          onChanged: context.read<SignupCubit>().onNameChanged,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: 'Username',
            hintText: 'Username',
            errorText: state.name.errorOf(context),
          ),
        ),
        const SizedBox(height: 8.0),
        XInput(
          key: const Key('loginForm_emailInput_textField'),
          value: state.email.value,
          onChanged: context.read<SignupCubit>().onEmailChanged,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Email',
            errorText: state.email.errorOf(context),
          ),
        ),
        const SizedBox(height: 8.0),
        XInput(
          value: state.password.value,
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: context.read<SignupCubit>().onPasswordChanged,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            errorText: state.password.errorOf(context),
          ),
        ),
        const SizedBox(height: 32.0),
        XButton(
          busy: state.status.isInProgress,
          enabled: state.isValidated,
          title: S.of(context).common_next,
          onPressed: () => context.read<SignupCubit>().signupWithEmail(context),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
