import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/account/account_provider.dart';
import 'package:smartbin/account/loading_account_page/load_account_page.dart';
import 'package:smartbin/style/colors.dart';
import 'package:smartbin/widgets/custom_text.dart';

class AccountErrorPage extends ConsumerWidget {
  const AccountErrorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning, size: 70, color: warnningRed),
          CustomText(
              'Server error', fontWeight: FontWeight.bold,
            fontSize: 23, textAlign: TextAlign.center),
          SizedBox(height: 5),
          CustomText(
              'THere was an error connection to the server or executing your request, note that you are still logged in',
            fontSize: 17, textAlign: TextAlign.center),
          SizedBox(height: 19),
          SizedBox(
            width: double.infinity, height: 45,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: azureBlue
              ),
              onPressed: () => ref.refresh(getAccount), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText('Retry', fontWeight: FontWeight.bold,),
                  SizedBox(width: 5),
                  Icon(Icons.refresh, size: 18, color: Colors.white)  
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () => ref.read(accountProvider.notifier).logout(), 
            child: Text('Logout', style: TextStyle(color: warnningRed)),
          )
        ],
      ),
    );
  }
}