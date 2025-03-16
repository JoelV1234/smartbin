
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/auth/models/auth_credentials.dart';
import 'package:smartbin/auth/auth_service.dart';

final authProvider = StateNotifierProvider<AuthProvider, AuthCredentials?>(
  (ref) => AuthProvider());

class AuthProvider extends StateNotifier<AuthCredentials?> {
  AuthProvider() : super(null);

  Future<AuthCredentials> login() async {
    state = await AuthService().login();
    return state!;
  }

  
  Future<void> logout() async {
    AuthService().logout();
    state = null;
  } 
}