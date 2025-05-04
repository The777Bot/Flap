import 'package:flutter/material.dart';

class AvatarDisplay extends StatelessWidget {
  final String powerType;

  const AvatarDisplay({super.key, required this.powerType});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 60,
      backgroundColor: Colors.purpleAccent,
      child: Icon(
        Icons.person,
        size: 60,
        color: Colors.white,
      ),
    );
  }
}
