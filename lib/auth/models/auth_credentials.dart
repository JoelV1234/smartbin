import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:equatable/equatable.dart';
import 'package:smartbin/auth/models/initial_user_info.dart';

class AuthCredentials with EquatableMixin {
  final String accessToken;
  final String uid;
  final DateTime expiresAt;
  final bool firstTimeLogin;
  final InitialUserInfo _initialAccountDetails;

  AuthCredentials(this._initialAccountDetails, {
    required this.firstTimeLogin,
    required this.accessToken,
    required this.uid,
    required this.expiresAt,
  });



  factory AuthCredentials.fromAuth0(Credentials credentials) {
    return AuthCredentials(
      InitialUserInfo.fromAuth0(credentials),
      firstTimeLogin: credentials.user.customClaims!['loginCount'] == 0,
      accessToken: credentials.accessToken,
      uid: credentials.user.sub.split('|').last,
      expiresAt: credentials.expiresAt,
    );
  }

  InitialUserInfo get initialProviderDetails => _initialAccountDetails;
  
  @override
  List<Object?> get props => [accessToken];
}