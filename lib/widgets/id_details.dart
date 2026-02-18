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
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
  ),
),

       style: ElevatedButton.styleFrom(
  backgroundColor: Colors.indigo,
  foregroundColor: Colors.white,
  elevation: 6,
  padding: const EdgeInsets.symmetric(vertical: 16),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(14),
  ),
),

        ),
      ],
    );
  }
}
