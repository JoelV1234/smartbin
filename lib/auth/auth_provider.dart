
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/auth/auth_credentials.dart';
import 'package:smartbin/auth/auth_service.dart';

final authProvider = Provider<AuthProvider>(
  (ref) => AuthProvider());

class AuthProvider {

  Future<AuthCredentials> login() async => AuthService().login();
  Future<void> logout() async => await AuthService().logout();

}