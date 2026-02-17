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

      /// GRADIENT APPBAR
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'IDify',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// SECTION TITLE
            const Text(
              'Create Digital ID',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            /// NAME INPUT
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Enter Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            /// ROLE DROPDOWN
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

            /// IMPROVED BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: generateIdCard,
                icon: const Icon(Icons.badge),
                label: const Text('Generate ID Card'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// LIST OF ID CARDS
            //Expanded(
              //child: ListView.builder(
                itemCount: generatedCards.length,
                itemBuilder: (context, index) {
                  final card = generatedCards[index];

                 
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),return Container(
  margin: const EdgeInsets.only(bottom: 16),
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
   gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1E3C72), // deep college blue
      Color(0xFF2A5298), // blue-purple shade
    ],
  ),
  borderRadius: BorderRadius.circular(20),
),
    borderRadius: BorderRadius.circular(18),
    boxShadow: const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: Offset(0, 5),
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // HEADER
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'COLLEGE ID CARD',
            style: TextStyle(
              color: Colors.white70,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(Icons.school, color: Colors.white70),
        ],
      ),

      const Divider(color: Colors.white30, height: 20),

      // BODY
      Row(
        children: [
          // Avatar
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 36,
            ),
          ),

          const SizedBox(width: 14),

          // Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                card['name']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                card['role']!,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),

      const SizedBox(height: 16),

      // FOOTER
      Text(
        'ID: ${card['id']}',
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 13,
        ),
      ),
    ],
  ),
);

                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.verified,
                            color: Colors.white70,
                            size: 26,
                          ),
                        ),
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
