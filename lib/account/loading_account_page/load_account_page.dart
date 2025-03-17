import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/account/account_provider.dart';
import 'package:smartbin/account/loading_account_page/account_error_page.dart';
import 'package:smartbin/account/loading_account_page/loading_account_widget.dart';


final getAccount = FutureProvider((ref) async {
  return ref.watch(accountProvider.notifier).getUserInfo();
});


class LoadAccountPage extends ConsumerWidget {
  final Widget destinationPage;
  const LoadAccountPage({super.key, required this.destinationPage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadAccount = ref.watch(getAccount);
    return Scaffold(
      body: loadAccount.when(
        data: (account) => destinationPage, 
        error: (error, stack) {
          return AccountErrorPage();
        }, 
        loading: () => LoadingAccountWidget()
      )
    );
  }
}