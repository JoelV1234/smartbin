import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smartbin/auth/auth_credentials.dart';

class AuthService {

  late Auth0 auth0;

  AuthService() {initialize();}

  Future<void> initialize() async {
    auth0 = Auth0(dotenv.env['AUTHDOMAIN']!, dotenv.env['AUTHCLIENTID']!);
  }

  Future<AuthCredentials> login() async {
      final credentials = await auth0.webAuthentication(
        scheme: 'smartbin').login(
          parameters: {'connection': 'google-oauth2'}, useHTTPS: true);
      return AuthCredentials(
        accessToken: credentials.accessToken,
        idToken: credentials.idToken,
        expiresAt: credentials.expiresAt
      );
  }
  Future<void> logout() async {
    await auth0.webAuthentication(scheme: 'smartbin').logout();
  }

}