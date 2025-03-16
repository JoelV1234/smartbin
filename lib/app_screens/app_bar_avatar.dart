import 'package:flutter/material.dart';

class CircularAvatar extends StatelessWidget {
  final String? imageUrl;

  const CircularAvatar({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: NetworkImage(
        imageUrl ?? 
        'https://cdn.pixabay.com/photo/2012/04/26/19/43/profile-42914_640.png'),
    );
  }
}