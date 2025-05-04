import 'package:flutter/material.dart';
import '../models/power_model.dart';
import '../widgets/custom_button.dart';
import 'main_world_screen.dart';

class PowerSelectionScreen extends StatefulWidget {
  final String name;

  const PowerSelectionScreen({super.key, required this.name});

  @override
  State<PowerSelectionScreen> createState() => _PowerSelectionScreenState();
}

class _PowerSelectionScreenState extends State<PowerSelectionScreen> {
  final TextEditingController _powerNameController = TextEditingController();
  final TextEditingController _weaknessController = TextEditingController();

  String selectedType = "Elemental";
  String selectedTrigger = "Voice Command";
  String selectedEffect = "Aura Glow";

  final List<String> types = [
    "Elemental",
    "Magical",
    "Psychic",
    "Summoning",
    "Physical",
    "Custom"
  ];

  final List<String> triggers = [
    "Voice Command",
    "Hand Gesture",
    "Emotion-Based",
    "Button Press"
  ];

  final List<String> effects = [
    "Aura Glow",
    "Anime Slash Effect",
    "Lightning Sparks",
    "Dark Mist"
  ];

  void _submitPower() {
    final power = PowerModel(
      name: _powerNameController.text,
      type: selectedType,
      trigger: selectedTrigger,
      appearanceEffect: selectedEffect,
      weakness: _weaknessController.text,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MainWorldScreen(
          name: widget.name,
          powerType: "${power.name} (${power.type})",
          trigger: power.trigger,
          effect: power.appearanceEffect,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Create Your Power"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              controller: _powerNameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Power Name",
                labelStyle: TextStyle(color: Colors.purpleAccent),
              ),
            ),
            const SizedBox(height: 16),
            _buildDropdown("Type", types, selectedType, (val) {
              setState(() => selectedType = val!);
            }),
            const SizedBox(height: 16),
            _buildDropdown("Trigger", triggers, selectedTrigger, (val) {
              setState(() => selectedTrigger = val!);
            }),
            const SizedBox(height: 16),
            _buildDropdown("Effect", effects, selectedEffect, (val) {
              setState(() => selectedEffect = val!);
            }),
            const SizedBox(height: 16),
            TextField(
              controller: _weaknessController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Optional Weakness",
                labelStyle: TextStyle(color: Colors.purpleAccent),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: "Finish & Enter World",
              onPressed: _submitPower,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String value,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
        DropdownButton<String>(
          value: value,
          dropdownColor: Colors.black,
          iconEnabledColor: Colors.purpleAccent,
          style: const TextStyle(color: Colors.white),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
