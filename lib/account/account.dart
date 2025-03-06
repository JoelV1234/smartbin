
import 'package:smartbin/auth/auth_credentials.dart' show AuthCredentials;

class Account {
  String token;
  String name;
  String email;
  AuthCredentials credentials;

  Account({
    required this.token,
    required this.email,
    required this.name,
    required this.credentials
  });
}