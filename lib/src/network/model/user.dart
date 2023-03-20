// ignore_for_file: public_member_api_docs, sort_constructors_first
class MUser {
  String id;
  String? name;
  String? email;
  MUser({
    required this.id,
    this.name,
    this.email,
  });
  factory MUser.empty() {
    return MUser(id: '');
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory MUser.fromMap(Map<String, dynamic> map) {
    return MUser(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  MUser copyWith({
    String? id,
    String? name,
    String? email,
  }) {
    return MUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
