import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class MUser with _$MUser {
  const MUser._();
  const factory MUser({
    required String id,
    String? name,
    String? avatar,
    String? email,
  }) = _MUser;

  factory MUser.empty() {
    return const MUser(id: '');
  }

  factory MUser.fromJson(Map<String, Object?> json) => _$MUserFromJson(json);
}
