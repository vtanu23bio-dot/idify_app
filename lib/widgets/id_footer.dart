dart
import 'package:flutter/material.dart';

class IdFooter extends StatelessWidget {
  final String id;

  const IdFooter({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'ID: $id',
      style: const TextStyle(color: Colors.white70),
    );
  }
}
