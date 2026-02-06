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
    if (nameController.text.isEmpty) return;

    setState(() {
      generatedCards.add({
        'name': nameController.text,
        'role': selectedRole,
        'id': (DateTime.now().millisecondsSinceEpoch % 100000).toString(),
      });
      nameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('IDify – Digital ID Generator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// NAME INPUT
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Enter Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            /// ROLE DROPDOWN (VISIBLE & RELIABLE)
            DropdownButton<String>(
              value: selectedRole,
              isExpanded: true,
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

            /// GENERATE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: generateIdCard,
                child: const Text('Generate ID Card'),
              ),
            ),

            const SizedBox(height: 16),

            /// LIST OF ID CARDS
            Expanded(
              child: ListView.builder(
                itemCount: generatedCards.length,
                itemBuilder: (context, index) {
                  final card = generatedCards[index];

                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
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
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          card['name']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          card['role']!,
                          style: const TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'ID: ${card['id']}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
