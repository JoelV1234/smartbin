import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/account/account_provider.dart';
import 'package:smartbin/auth/auth_page.dart';
import 'package:smartbin/home_screen.dart';

class AppGate extends ConsumerWidget {
  const AppGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(accountProvider);
    return auth != null ? const HomeScreen() : const AuthPage(); 
  }
}