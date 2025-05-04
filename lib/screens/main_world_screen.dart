import 'package:flutter/material.dart';
import '../widgets/avatar_display.dart';
import '../widgets/avatar_glb_viewer.dart';

class MainWorldScreen extends StatelessWidget {
  final String name;
  final String powerType;
  final String? trigger;
  final String? effect;

  const MainWorldScreen({
    super.key,
    required this.name,
    required this.powerType,
    this.trigger,
    this.effect,
  });

  void _activatePower(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          "⚡ Power Activated!",
          style: TextStyle(color: Colors.purpleAccent),
        ),
        content: Text(
          powerType.contains("Custom")
              ? "Custom Power: $powerType\n\nTriggered by: $trigger\nEffect: $effect"
              : "$powerType Power Activated!",
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cool!", style: TextStyle(color: Colors.purpleAccent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Welcome to Flap World"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "👾 Avatar Loaded",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 20),

              // 2D Avatar Display
              AvatarDisplay(powerType: powerType),
              const SizedBox(height: 20),

              // 3D Avatar Display
              SizedBox(
                height: 300,
                child: AvatarGLBViewer(),
              ),
              const SizedBox(height: 20),

              Text(
                "Name: $name",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                "Power: $powerType",
                style: const TextStyle(fontSize: 18, color: Colors.purpleAccent),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                ),
                onPressed: () => _activatePower(context),
                child: const Text("Use Power"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
