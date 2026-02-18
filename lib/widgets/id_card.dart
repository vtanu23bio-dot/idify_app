import 'package:flutter/material.dart';

import 'id_header.dart';
import 'id_details.dart';
import 'id_footer.dart';

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
      margin: const EdgeInsets.symmetric(vertical: 12),
     padding: const EdgeInsets.all(20),
margin: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
  gradient: const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1E3C72), // deep college blue
      Color(0xFF2A5298), // premium blue shade
    ],
  ),
  borderRadius: BorderRadius.circular(20),
  boxShadow: const [
    BoxShadow(
      color: Colors.black38,
      blurRadius: 14,
      offset: Offset(0, 6),
    ),
  ],
),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const IdHeader(),
          const SizedBox(height: 12),
          IdDetails(
            name: name,
            role: role,
          ),
          const SizedBox(height: 8),
          IdFooter(id: id),
        ],
      ),
    );
  }
}
