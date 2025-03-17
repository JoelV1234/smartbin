import 'dart:convert';
import 'package:smartbin/account/account.dart';
import 'package:smartbin/api/api_provider.dart';
import 'package:smartbin/api/model/endpoints.dart';

class AccountService {
  final ServerApi serverApi;
  AccountService(this.serverApi);

  Future<void> createUserInDb(Account account) async {
      await serverApi.httpPost(
        endpoint : Endpoints.createUser,
        body: account.toMap()
      );
  }


  Future<Account> getUserInfo() async {
    final response = await serverApi.httpGet(endpoint : Endpoints.getUsers);
    print("======================");
    print(response.data);
    return Account.fromJson(jsonDecode(response.data));
  }

}