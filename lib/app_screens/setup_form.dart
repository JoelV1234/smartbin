import 'package:flutter/material.dart';
import 'package:smartbin/widgets/custom_text.dart';

class SetupScreen extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool centerTitle;
  final Widget description;
  final GlobalKey<ScaffoldMessengerState>? messengerKey;

  const SetupScreen({
    super.key,
    required this.description,
    required this.title,
    required this.children,
    this.messengerKey,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: messengerKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomText(
                  textAlign: centerTitle ? TextAlign.center : TextAlign.left,
                  title,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                description,
                SizedBox(height: 20,),
              ] + children
            ),
          ),
        ),
      ),
    );
  }
}