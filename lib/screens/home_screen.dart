import 'dart:io';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../widgets/custom_button.dart';
import 'character_creation_screen.dart';
import 'power_systems_screen.dart';
import 'creators_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playIntroMusic();
  }

  void _playIntroMusic() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource('audio/intro_music.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _exitApp() {
    exit(0); // Works for desktop
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/intro_bg.jpg',
            fit: BoxFit.cover,
          ),

          // UI content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Text(
                    "Welcome to FLAP",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 127, 208, 223),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Bring your imagination to life",
                    style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 253, 252, 252)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: "Start Your Journey",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CharacterCreationScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: "Explore Power Systems",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PowerSystemsScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: "Meet Other Creators",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CreatorsScreen(),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),

          // Exit button - bottom right
          Positioned(
            bottom: 20,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.exit_to_app, color: Colors.white),
              iconSize: 30,
              onPressed: _exitApp,
              tooltip: 'Exit',
            ),
          ),
        ],
      ),
    );
  }
}
