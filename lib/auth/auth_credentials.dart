import 'package:equatable/equatable.dart';

class AuthCredentials with EquatableMixin {
  final String accessToken;
  final String idToken;
  final DateTime expiresAt;

  AuthCredentials({
    required this.accessToken,
    required this.idToken,
    required this.expiresAt,
  });
  
  @override
  List<Object?> get props => [accessToken];
}