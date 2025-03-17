import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/account/account_provider.dart';
import 'package:smartbin/app_screens/app_bar_avatar.dart';


class AppScreen extends ConsumerWidget {
  final String title;
  final Widget child;

  const AppScreen({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileImageUrl = ref.watch(accountProvider)?.picture;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircularAvatar(imageUrl: profileImageUrl),
          ),
        ],
      ),
      body:  child,
    );
  }
}