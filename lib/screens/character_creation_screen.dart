import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import 'main_world_screen.dart';
import 'power_selection_screen.dart';
// import '../models/power_model.dart'; // This import is not required here.

class CharacterCreationScreen extends StatefulWidget {
  const CharacterCreationScreen({super.key});

  @override
  State<CharacterCreationScreen> createState() => _CharacterCreationScreenState();
}

class _CharacterCreationScreenState extends State<CharacterCreationScreen> {
  final TextEditingController _nameController = TextEditingController();
  String selectedPowerType = "Fire"; // default

  final List<String> powerTypes = ["Fire", "Water", "Telekinesis", "Time Control", "Custom"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Create Your Character"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Enter your name",
                labelStyle: TextStyle(color: Colors.purpleAccent),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Select Power Type",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedPowerType,
              dropdownColor: Colors.black,
              iconEnabledColor: Colors.purpleAccent,
              style: const TextStyle(color: Colors.white),
              items: powerTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPowerType = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Next",
              onPressed: () {
                if (selectedPowerType == "Custom") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PowerSelectionScreen(name: _nameController.text),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MainWorldScreen(
                        name: _nameController.text,
                        powerType: selectedPowerType,
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
