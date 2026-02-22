import 'package:flutter/material.dart';

class NoNotesMessage extends StatelessWidget {
  const NoNotesMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.note_alt_outlined,
          size: 80,
          color: Colors.grey,
        ),
        SizedBox(height: 16),
        Text(
          'No Notes Yet',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Start by adding your first note ✨',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}