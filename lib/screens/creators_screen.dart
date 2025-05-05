import 'package:flutter/material.dart';

class CreatorsScreen extends StatelessWidget {
  const CreatorsScreen({super.key});

  final List<Map<String, String>> creators = const [
    {
      'name': 'KiraX',
      'power': 'Shadow Clones',
      'message': "Master of stealth!",
    },
    {
      'name': 'SakuraSoul',
      'power': 'Petal Slash',
      'message': "My powers bloom with rage 🌸",
    },
    {
      'name': 'VoidRonin',
      'power': 'Voidfire',
      'message': "Fear the darkness 🔥",
    },
    {
      'name': 'Tempus',
      'power': 'Time Control',
      'message': "Catch me if you can ⏳",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Meet Other Creators'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: creators.length,
        separatorBuilder: (_, __) => const Divider(color: Colors.white24),
        itemBuilder: (context, index) {
          final creator = creators[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purpleAccent,
              child: Text(creator['name']![0], style: const TextStyle(color: Colors.black)),
            ),
            title: Text(
              creator['name']!,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "${creator['power']} • ${creator['message']}",
              style: const TextStyle(color: Colors.white70),
            ),
          );
        },
      ),
    );
  }
}
