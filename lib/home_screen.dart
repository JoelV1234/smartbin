import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/account/account_provider.dart';
import 'package:smartbin/app_screens/app_screen.dart';


class HomeScreen extends ConsumerWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScreen(
      title: 'Home',
      child: Center(
        child: TextButton(
          onPressed: () => ref.read(accountProvider.notifier).logout(), 
          child: Text('Logout')
        )
      ),
    );
  }
}