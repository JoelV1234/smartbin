import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/account/account.dart';
import 'package:smartbin/account/account_provider.dart';
import 'package:smartbin/app_screens/setup_form.dart';
import 'package:smartbin/auth/auth_provider.dart';
import 'package:smartbin/auth/models/initial_user_info.dart';
import 'package:smartbin/app_screens/app_bar_avatar.dart';
import 'package:smartbin/style/colors.dart';
import 'package:smartbin/widgets/custom_text.dart';


class CreateAccountPage extends ConsumerStatefulWidget {
  const CreateAccountPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends ConsumerState<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  late final InitialUserInfo initialUserInfo;
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final String profilePic;
  bool loading = false;

  void createAccount() async {
    if (_formKey.currentState!.validate()) {
      setState(() => loading = true);
      await ref.read(accountProvider.notifier).createDbUser(
        Account(
          name: _usernameController.text,
          email: _emailController.text,
          picture: profilePic,
        ),
      );
      setState(() => loading = false);
    }
  }


  @override
  void initState() {
    initialUserInfo = ref.read(authProvider)!.initialProviderDetails;
    _usernameController = TextEditingController(text: initialUserInfo.name);
    _emailController = TextEditingController(text: initialUserInfo.email);
    profilePic = initialUserInfo.picture!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircularAvatar(imageUrl: profilePic),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SetupScreen(
          title: 'Create Account',
          description: CustomText(
            'Please enter a preffered username and email address'),
          children: <Widget>[
            TextFormField(
              enabled: !loading,
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              enabled: !loading,
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: azureBlue,
                ),
                onPressed: createAccount,
                child: loading ? SizedBox(
                  height: 16, width: 16,
                  child: CircularProgressIndicator(color: white),
                ) :  Text('Create Account'),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed:() => ref.read(accountProvider.notifier).logout(), 
              child: CustomText('Logout')
            )
          ],
        ),
      ),
    );
  }
}