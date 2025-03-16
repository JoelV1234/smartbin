class Account {
  final String name;
  final String email;
  final String picture;

  Account({
    required this.email,
    required this.name,
    required this.picture,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      email: json['email'],
      name: json['name'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'picture': picture,
    };
  }
}