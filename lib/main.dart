@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[100],

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

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: generateIdCard,
              icon: const Icon(Icons.badge),
              label: const Text('Generate ID Card'),
            ),
          ),

          const SizedBox(height: 16),

          /// ✅ LIST OF GENERATED CARDS
          Expanded(
            child: ListView.builder(
              itemCount: generatedCards.length,
              itemBuilder: (context, index) {
                final card = generatedCards[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF1E3C72),
                        Color(0xFF2A5298),
                      ],
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
                        'COLLEGE ID CARD',
                        style: TextStyle(
                          color: Colors.white70,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          const Icon(Icons.person, color: Colors.white, size: 36),
                          const SizedBox(width: 12),
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
                              Text(
                                card['role']!,
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Text(
                        'ID: ${card['id']}',
                        style: const TextStyle(color: Colors.white70),
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
