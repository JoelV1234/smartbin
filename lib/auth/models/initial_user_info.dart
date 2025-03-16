import 'package:auth0_flutter/auth0_flutter.dart';

class InitialUserInfo {
  final String? name;
  final String? email;
  final String? picture;
  final String id;
  InitialUserInfo({this.email, this.name, this.picture, required this.id});

  factory InitialUserInfo.fromAuth0(Credentials credentials) {
    final UserProfile user = credentials.user;
    return InitialUserInfo(
      email: user.email,
      name: user.name,
      picture: user.pictureUrl.toString(),
      id: user.sub.split('|').last,
    );
  }
  
}