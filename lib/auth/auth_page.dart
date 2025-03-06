import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartbin/auth/google_sign_in_button.dart';
import 'package:smartbin/style/colors.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/auth_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200),
            Text(
              'Smart bin',
              style: GoogleFonts.alfaSlabOne(
                fontSize: 50,
                color: primary
              ),
            ),
            GoogleSignInButton(),
          ],
        ),
      )
    );
  }
}