import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const FlapApp());
}

class FlapApp extends StatelessWidget {
  const FlapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flap',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
