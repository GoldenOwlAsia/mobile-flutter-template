part of 'account_bloc.dart';

class AccountState extends Equatable {
  const AccountState({
    required this.user,
    this.locale = 'vi',
  });

  factory AccountState.ds() {
    return AccountState(
      user: MUser.empty(),
    );
  }

  final MUser user;
  final String locale;

  bool get isLogin => user.id.isNotEmpty; // && token.isNotEmpty

  @override
  List<Object?> get props => [user, locale];

  AccountState login(MUser user) {
    return copyWith(user: user);
  }

  AccountState logOut() {
    return copyWith(user: MUser.empty());
  }

  AccountState copyWith({
    MUser? user,
    String? locale,
  }) {
    return AccountState(
      user: user ?? this.user,
      locale: locale ?? this.locale,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'locale': locale,
    };
  }

  factory AccountState.fromJson(Map<String, dynamic> json) {
    return AccountState(
      user: json['user'] != null
          ? MUser.fromJson(json['user'] as Map<String, dynamic>)
          : MUser.empty(),
      locale: json['locale'] as String? ?? 'vi',
    );
  }
}
