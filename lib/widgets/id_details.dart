dart
import 'package:flutter/material.dart';

class IdDetails extends StatelessWidget {
  final String name;
  final String role;

  const IdDetails({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          role,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}
