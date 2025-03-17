import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/account/account_provider.dart';
import 'package:smartbin/account/create_account_page.dart';
import 'package:smartbin/account/loading_account_page/load_account_page.dart';
import 'package:smartbin/auth/auth_page.dart';
import 'package:smartbin/auth/auth_provider.dart';
import 'package:smartbin/home_screen.dart';


class AppGate extends ConsumerWidget {
  const AppGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);   
    final account = ref.watch(accountProvider);
    if(auth == null) {
      return AuthPage();
    } else {
      if(auth.firstTimeLogin == true && account == null) {
        return const CreateAccountPage();
      } 
      return const LoadAccountPage(
        destinationPage: HomeScreen(),
      );
    }
  }
}