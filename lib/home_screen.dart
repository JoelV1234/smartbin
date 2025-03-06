import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/account/account_provider.dart';


class HomeScreen extends ConsumerWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => ref.read(accountProvider.notifier).logout(), 
          child: Text('Logout')
        )
      ),
    );
  }
}