// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MSocialUser {

 MSocialType get type;/// Apple and Facebook userID
 String? get userID;/// Facebook & Google Access Token
 String? get accessToken;/// Google ID Token
 String? get idToken;/// FB and Google information
 String? get fullName; String? get email; String? get avatar; String? get birthDate; int? get gender; String? get phone;
/// Create a copy of MSocialUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MSocialUserCopyWith<MSocialUser> get copyWith => _$MSocialUserCopyWithImpl<MSocialUser>(this as MSocialUser, _$identity);

  /// Serializes this MSocialUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MSocialUser&&(identical(other.type, type) || other.type == type)&&(identical(other.userID, userID) || other.userID == userID)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,userID,accessToken,idToken,fullName,email,avatar,birthDate,gender,phone);

@override
String toString() {
  return 'MSocialUser(type: $type, userID: $userID, accessToken: $accessToken, idToken: $idToken, fullName: $fullName, email: $email, avatar: $avatar, birthDate: $birthDate, gender: $gender, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $MSocialUserCopyWith<$Res>  {
  factory $MSocialUserCopyWith(MSocialUser value, $Res Function(MSocialUser) _then) = _$MSocialUserCopyWithImpl;
@useResult
$Res call({
 MSocialType type, String? userID, String? accessToken, String? idToken, String? fullName, String? email, String? avatar, String? birthDate, int? gender, String? phone
});




}
/// @nodoc
class _$MSocialUserCopyWithImpl<$Res>
    implements $MSocialUserCopyWith<$Res> {
  _$MSocialUserCopyWithImpl(this._self, this._then);

  final MSocialUser _self;
  final $Res Function(MSocialUser) _then;

/// Create a copy of MSocialUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? userID = freezed,Object? accessToken = freezed,Object? idToken = freezed,Object? fullName = freezed,Object? email = freezed,Object? avatar = freezed,Object? birthDate = freezed,Object? gender = freezed,Object? phone = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MSocialType,userID: freezed == userID ? _self.userID : userID // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,idToken: freezed == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MSocialUser].
extension MSocialUserPatterns on MSocialUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MSocialUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MSocialUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MSocialUser value)  $default,){
final _that = this;
switch (_that) {
case _MSocialUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MSocialUser value)?  $default,){
final _that = this;
switch (_that) {
case _MSocialUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MSocialType type,  String? userID,  String? accessToken,  String? idToken,  String? fullName,  String? email,  String? avatar,  String? birthDate,  int? gender,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MSocialUser() when $default != null:
return $default(_that.type,_that.userID,_that.accessToken,_that.idToken,_that.fullName,_that.email,_that.avatar,_that.birthDate,_that.gender,_that.phone);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MSocialType type,  String? userID,  String? accessToken,  String? idToken,  String? fullName,  String? email,  String? avatar,  String? birthDate,  int? gender,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _MSocialUser():
return $default(_that.type,_that.userID,_that.accessToken,_that.idToken,_that.fullName,_that.email,_that.avatar,_that.birthDate,_that.gender,_that.phone);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MSocialType type,  String? userID,  String? accessToken,  String? idToken,  String? fullName,  String? email,  String? avatar,  String? birthDate,  int? gender,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _MSocialUser() when $default != null:
return $default(_that.type,_that.userID,_that.accessToken,_that.idToken,_that.fullName,_that.email,_that.avatar,_that.birthDate,_that.gender,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MSocialUser implements MSocialUser {
  const _MSocialUser({required this.type, this.userID, this.accessToken, this.idToken, this.fullName, this.email, this.avatar, this.birthDate, this.gender, this.phone});
  factory _MSocialUser.fromJson(Map<String, dynamic> json) => _$MSocialUserFromJson(json);

@override final  MSocialType type;
/// Apple and Facebook userID
@override final  String? userID;
/// Facebook & Google Access Token
@override final  String? accessToken;
/// Google ID Token
@override final  String? idToken;
/// FB and Google information
@override final  String? fullName;
@override final  String? email;
@override final  String? avatar;
@override final  String? birthDate;
@override final  int? gender;
@override final  String? phone;

/// Create a copy of MSocialUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MSocialUserCopyWith<_MSocialUser> get copyWith => __$MSocialUserCopyWithImpl<_MSocialUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MSocialUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MSocialUser&&(identical(other.type, type) || other.type == type)&&(identical(other.userID, userID) || other.userID == userID)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,userID,accessToken,idToken,fullName,email,avatar,birthDate,gender,phone);

@override
String toString() {
  return 'MSocialUser(type: $type, userID: $userID, accessToken: $accessToken, idToken: $idToken, fullName: $fullName, email: $email, avatar: $avatar, birthDate: $birthDate, gender: $gender, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$MSocialUserCopyWith<$Res> implements $MSocialUserCopyWith<$Res> {
  factory _$MSocialUserCopyWith(_MSocialUser value, $Res Function(_MSocialUser) _then) = __$MSocialUserCopyWithImpl;
@override @useResult
$Res call({
 MSocialType type, String? userID, String? accessToken, String? idToken, String? fullName, String? email, String? avatar, String? birthDate, int? gender, String? phone
});




}
/// @nodoc
class __$MSocialUserCopyWithImpl<$Res>
    implements _$MSocialUserCopyWith<$Res> {
  __$MSocialUserCopyWithImpl(this._self, this._then);

  final _MSocialUser _self;
  final $Res Function(_MSocialUser) _then;

/// Create a copy of MSocialUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? userID = freezed,Object? accessToken = freezed,Object? idToken = freezed,Object? fullName = freezed,Object? email = freezed,Object? avatar = freezed,Object? birthDate = freezed,Object? gender = freezed,Object? phone = freezed,}) {
  return _then(_MSocialUser(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MSocialType,userID: freezed == userID ? _self.userID : userID // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,idToken: freezed == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
