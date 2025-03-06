import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/account/account.dart';
import 'package:smartbin/auth/auth_credentials.dart';
import 'package:smartbin/auth/auth_provider.dart';

final accountProvider = StateNotifierProvider<AccountProvider, Account?>(
  (ref) => AccountProvider(ref));

class AccountProvider extends StateNotifier<Account?> {
  
  final Ref ref;
  AuthProvider get auth => ref.read(authProvider);
  AccountProvider(this.ref) : super(null);



  Future<void> login() async {
    AuthCredentials account = await auth.login();
    state = Account(
      token: account.accessToken,
      email: 'email',
      name: 'name',
      credentials: account
    ); 
  }

  Future<void> logout() async {
    auth.logout();
    state = null;
  }
}