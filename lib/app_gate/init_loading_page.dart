import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/account/account_provider.dart';



final getAccount = FutureProvider((ref) async {
  return ref.watch(accountProvider.notifier).getUserInfo();
});


class InitLoadingPage extends ConsumerWidget {
  const InitLoadingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(getAccount);
    return Scaffold(
      body: account.when(
        data: (account) {
         return const SizedBox();
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(error.toString()),
              ElevatedButton(
                onPressed: () {
                  ref.read(accountProvider.notifier).logout();
                },
                child: const Text('Go to login page'),
              ),
            ],
          ),
        )
      ),
    );
  }
}