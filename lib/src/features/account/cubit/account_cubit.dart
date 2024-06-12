import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/src/core/dialogs/alert_wrapper.dart';
import 'package:myapp/src/core/dialogs/widget/alert_dialog.dart';
import 'package:myapp/src/core/localization/localization_utils.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/core/utils/prefs_utils.dart';
import 'package:myapp/src/core/models/user/user.dart';
import 'package:myapp/src/features/account/domain/use_cases/get_user_use_case.dart';
import 'package:myapp/src/features/account/domain/use_cases/remove_account_use_case.dart';
import 'package:myapp/src/features/account/domain/use_cases/sign_out_use_case.dart';

part 'account_state.dart';

@lazySingleton
class AccountCubit extends Cubit<AccountState> {
  AccountCubit(
    this._getUserUseCase,
    this._signOutUseCase,
    this._removeAccountUseCase,
  ) : super(AccountState.ds()) {
    syncUserData();
  }

  final GetUserUseCase _getUserUseCase;
  final SignOutUseCase _signOutUseCase;
  final RemoveAccountUseCase _removeAccountUseCase;

  StreamController<UserModel> statusStream = StreamController.broadcast();

  Future syncUserData() async {
    final String id = state.user.id;
    if (id.isNotEmpty == true) {
      final result = await _getUserUseCase.call(params: id);
      if (result is DataSuccess) {
        onUserChange(state.copyWith(user: result.data));
      } else {
        onUserChange(state.logOut());
      }
    }
  }

  void onLoginSuccess(UserModel user) {
    onUserChange(state.login(user));
  }

  void onEditProfileSuccess({required String name}) {
    onUserChange(
      state.copyWith(user: state.user.copyWith(name: name)),
    );
  }

  Future onLogOut(BuildContext context) async {
    final key = await XAlert.show(
      title: 'Logout',
      body: 'Are you sure you would like to logout?',
      actions: [
        XAlertButton(
          title: S.text.common_yes,
          isDestructiveAction: true,
          key: 'yes',
        ),
        XAlertButton(title: S.text.common_no),
      ],
    );
    if (key == 'yes') {
      _signOutUseCase.call(params: state.user);
      onUserChange(state.logOut());
      return true;
    }
    return false;
  }

  Future onRemoveAccount(BuildContext context) async {
    final key = await XAlert.show(
      title: 'Remove Account',
      body:
          'Are you sure you would like to remove account? Your profile will be cleared',
      actions: [
        XAlertButton(
          title: S.text.common_yes,
          isDestructiveAction: true,
          key: 'yes',
        ),
        XAlertButton(title: S.text.common_no),
      ],
    );
    if (key == 'yes') {
      _removeAccountUseCase.call(params: state.user);
      onUserChange(state.logOut());
      return true;
    }
    return false;
  }

  void onUserChange(AccountState newstate) {
    // setup token and param http
    PrefsUtils.instance.setUser(newstate.user);
    emit(newstate);
  }
}
