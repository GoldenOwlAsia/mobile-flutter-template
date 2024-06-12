part of 'account_cubit.dart';

class AccountState extends Equatable {
  const AccountState({
    required this.user,
    this.locale = 'vi',
  });
  factory AccountState.ds() {
    return AccountState(
      user: PrefsUtils.I.getUser() ?? UserModel.empty(),
    );
  }

  final UserModel user;
  final String locale;

  bool get isLogin => user.id.isNotEmpty; // && token.isNotEmpty

  @override
  List<Object?> get props => [user, locale];

  AccountState login(UserModel user) {
    return copyWith(user: user);
  }

  AccountState logOut() {
    return copyWith(user: UserModel.empty());
  }

  AccountState copyWith({
    UserModel? user,
    String? locale,
  }) {
    return AccountState(
      user: user ?? this.user,
      locale: locale ?? this.locale,
    );
  }
}
