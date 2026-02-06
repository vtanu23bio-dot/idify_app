import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const IDifyApp());
}

class IDifyApp extends StatelessWidget {
  const IDifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IDify',
      home: const IDifyHome(),
    );
  }
}

class IDifyHome extends StatefulWidget {
  const IDifyHome({super.key});

  @override
  State<IDifyHome> createState() => _IDifyHomeState();
}

class _IDifyHomeState extends State<IDifyHome> {
  final TextEditingController _nameController = TextEditingController();
  final Random _random = Random();

  String name = "Your Name";
  String role = "Flutter Developer";
  int idNumber = 0;

  final List<String> roles = [
    "Flutter Developer",
    "UI/UX Designer",
    "Software Intern",
    "Project Manager",
  ];

  void generateID() {
    setState(() {
      name = _nameController.text.isEmpty
          ? "Unnamed User"
          : _nameController.text;
      role = roles[_random.nextInt(roles.length)];
      idNumber = _random.nextInt(90000) + 10000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("IDify – Digital ID Generator"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 300,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.badge, color: Colors.white, size: 50),
                    const SizedBox(height: 10),
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      role,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "ID: $idNumber",
                      style: const TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: generateID,
                child: const Text("Generate ID"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
