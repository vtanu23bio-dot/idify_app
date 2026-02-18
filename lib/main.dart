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
      theme: ThemeData(primarySwatch: Colors.indigo),
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
  String selectedRole = 'Student';

  final List<Map<String, String>> generatedCards = [];

  void generateIdCard() {
    if (nameController.text.trim().isEmpty) return;

    setState(() {
      generatedCards.add({
        'name': nameController.text.trim(),
        'role': selectedRole,
        'id': (DateTime.now().millisecondsSinceEpoch % 100000).toString(),
      });
      nameController.clear();
    });
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'IDify – Digital ID Generator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create Digital ID',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Enter Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: selectedRole,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select Role',
              ),
              items: const [
                DropdownMenuItem(value: 'Student', child: Text('Student')),
                DropdownMenuItem(value: 'Employee', child: Text('Employee')),
                DropdownMenuItem(value: 'Intern', child: Text('Intern')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: generateIdCard,
                icon: const Icon(Icons.badge),
                label: const Text('Generate ID Card'),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: generatedCards.length,
                itemBuilder: (context, index) {
                  final card = generatedCards[index];
                  return IdCard(
                    name: card['name']!,
                    role: card['role']!,
                    id: card['id']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  };
};

class IdCard extends StatelessWidget {
  final String name;
  final String role;
  final String id;

  const IdCard({
    super.key,
    required this.name,
    required this.role,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'IDENTITY CARD',
            style: TextStyle(
              color: Colors.white70,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            role,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            'ID: $id',
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  };
};
