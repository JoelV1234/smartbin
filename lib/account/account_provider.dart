import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/account/account.dart';
import 'package:smartbin/account/account_service.dart';
import 'package:smartbin/api/api_provider.dart';
import 'package:smartbin/auth/auth_provider.dart';

final accountProvider = StateNotifierProvider<AccountProvider, Account?>(
  (ref) => AccountProvider(ref));

class AccountProvider extends StateNotifier<Account?> {
  
  final Ref ref;
  AuthProvider get auth => ref.read(authProvider.notifier);
  AccountService accountService;
  AccountProvider(this.ref) : 
    accountService = AccountService(ref.read(serverApiProvider)), super(null);



  Future<void> login() => auth.login();

  Future<void> getUserInfo() async {
    state = await accountService.getUserInfo();
  }

  Future<void> createDbUser(Account account) async {
    await accountService.createUserInDb(account);
    state = account;
  } 

  Future<void> logout() async {
    state = null;
    auth.logout();
  }
}