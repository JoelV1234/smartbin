import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/account/loading_account_page/loading_account_avatar.dart';
import 'package:smartbin/auth/auth_provider.dart';
import 'package:smartbin/widgets/custom_text.dart';


class LoadingAccountWidget extends ConsumerWidget {
  const LoadingAccountWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.read(authProvider)!.initialProviderDetails;
    print("===============================");
    print(ref.read(authProvider)?.accessToken);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAccountAvatar(radius: 40, imageUrl: account.picture),
          SizedBox(height: 10),
          Center(
            child: CustomText('Loading your account', fontSize: 25)
          ),
        ],
      )
    );
  }
}