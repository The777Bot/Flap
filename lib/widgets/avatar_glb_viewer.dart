import 'package:flutter/material.dart';

class AvatarGLBViewer extends StatelessWidget {
  const AvatarGLBViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.purpleAccent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.purpleAccent),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 100,
              color: Colors.purpleAccent,
            ),
            SizedBox(height: 10),
            Text(
              '3D Avatar Placeholder',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
