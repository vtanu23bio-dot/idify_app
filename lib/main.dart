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
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  String generatedName = '';
  int generatedId = 0;
  String selectedRole = 'Student';


  void generateIdCard() {
    setState(() {
      generatedName = nameController.text;
      generatedId = DateTime.now().millisecondsSinceEpoch % 100000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IDify – Digital ID Generator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),DropdownButton<String>(
  value: selectedRole,
  items: const [
    DropdownMenuItem(value: 'Student', child: Text('Student')),
    DropdownMenuItem(value: 'Employee', child: Text('Employee')),
  ],
  onChanged: (value) {
    setState(() {
      selectedRole = value!;
    });
  },
),
const SizedBox(height: 20),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateIdCard,
              child: const Text('Generate ID'),
            ),
            const SizedBox(height: 30),
         if (generatedName.isNotEmpty)
  Container(
    margin: const EdgeInsets.only(top: 20),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Colors.indigo, Colors.blueAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 6),
        ),
      ],
    ),
    child: Column(
      children: [
        const Icon(
          Icons.badge,
          size: 48,
          color: Colors.white,
        ),
        const SizedBox(height: 12),
        Text(
          generatedName,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          selectedRole,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 12),
        const Divider(color: Colors.white54),
        const SizedBox(height: 8),
        Text(
          'ID: $generatedId',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
      ],
    ),
  ),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        generatedName,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 6),
Text(
  selectedRole,
  style: const TextStyle(fontSize: 16),
),

                      const SizedBox(height: 10),
                      Text(
                        'ID: $generatedId',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

