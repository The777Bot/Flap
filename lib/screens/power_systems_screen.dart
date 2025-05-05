import 'package:flutter/material.dart';

class PowerSystemsScreen extends StatelessWidget {
  const PowerSystemsScreen({super.key});

  final List<Map<String, String>> powerSystems = const [
    {
      'name': 'Fire Manipulation',
      'icon': '🔥',
      'description': 'Control and generate fire to burn or protect.',
    },
    {
      'name': 'Time Control',
      'icon': '⏳',
      'description': 'Slow, freeze, or rewind time briefly.',
    },
    {
      'name': 'Illusion Craft',
      'icon': '🌀',
      'description': 'Create visual illusions to confuse enemies.',
    },
    {
      'name': 'Voidfire',
      'icon': '🖤🔥',
      'description': 'Dark flames that consume energy and emotion.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Explore Power Systems'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: powerSystems.length,
        itemBuilder: (context, index) {
          final power = powerSystems[index];
          return Card(
            color: Colors.deepPurple.shade900,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              leading: Text(
                power['icon']!,
                style: const TextStyle(fontSize: 28),
              ),
              title: Text(
                power['name']!,
                style: const TextStyle(color: Colors.purpleAccent, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                power['description']!,
                style: const TextStyle(color: Colors.white70),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.purpleAccent,
                  content: Text("Previewing ${power['name']}... (FX coming soon!)"),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
