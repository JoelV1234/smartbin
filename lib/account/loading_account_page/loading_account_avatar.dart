import 'package:flutter/material.dart';
import 'package:smartbin/style/colors.dart';

class LoadingAccountAvatar extends StatelessWidget {
  final double radius;
  final String? imageUrl;
  const LoadingAccountAvatar({
    super.key,
    required this.radius,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: radius * 2 + 10,
          width: radius * 2 + 10,
          child: CircularProgressIndicator(
            strokeWidth: 6,
            color: primary,
          ),
        ),
        CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(imageUrl!),
        )
      ]
    );
  }
}