import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/src/network/model/social_type.dart';

class MSocialUser {
  MSocialType type;

  /// Apple and Facebook userID
  String? userID;

  /// Facebook & Google Access Token
  String? accessToken;

  /// Google ID Token
  String? idToken;

  /// FB and Google information
  String? fullName;
  String? email;
  String? avatar;
  String? birthDate;
  int? gender;
  String? phone;
  MSocialUser({
    required this.type,
    this.accessToken,
    this.idToken,
    this.userID,
    this.fullName,
    this.email,
    this.avatar,
    this.birthDate,
    this.gender,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'FullName': fullName?.isNotEmpty == true ? fullName : 'User',
      if (email != null) 'Email': email ?? '',
      if (avatar != null) 'Avatar': avatar ?? '',
      if (birthDate != null) 'BirthDate': birthDate,
      if (gender != null) 'Gender': gender,
      if (phone != null) 'Phone': phone ?? '',
      if (userID != null) 'UserID': userID ?? '',
    };
  }

  factory MSocialUser.fromMap(
      Map<String, dynamic> map, MSocialType socialType) {
    return MSocialUser(
      type: socialType,
      fullName: map['FullName'] != null ? map['FullName'] : null,
      email: map['Email'] != null ? map['Email'] : null,
      avatar: map['Avatar'] != null ? map['Avatar'] : null,
      birthDate: map['BirthDate'] != null ? map['BirthDate'] : null,
      gender: map['Gender'] != null ? map['Gender'] : null,
      phone: map['Phone'] != null ? map['Phone'] : null,
    );
  }

  factory MSocialUser.fromGoogleAccount(
      GoogleSignInAccount account, GoogleSignInAuthentication googleAuth) {
    return MSocialUser(
      type: MSocialType.google,
      fullName: account.displayName,
      email: account.email,
      avatar: account.photoUrl,
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
  }

  // factory NSocialUser.fromAppleAccount(AuthorizationCredentialAppleID credential) {
  //   return NSocialUser(
  //     type: NSocialType.apple,
  //     userID: credential.userIdentifier,
  //     fullName: Utils.fullnameOf(credential.givenName, credential.familyName),
  //     email: credential.email,
  //   );
  // }

  // factory NSocialUser.fromFacebookAccount(Map<String, dynamic> userData, AccessToken token) {
  //   return NSocialUser(
  //     type: NSocialType.facebook,
  //     fullName: userData['name'],
  //     email: userData['email'],
  //     userID: token.userId,
  //     fbAccessToken: token.token,
  //     avatar: ((userData['picture'] ?? {})['data'] ?? {})['url'] ?? '',
  //   );
  // }
}
