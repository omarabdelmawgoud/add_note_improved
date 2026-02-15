import 'package:flutter/material.dart';
import 'package:second_note_app/constants.dart';

class CustomAppBarIcon extends StatelessWidget {
  const CustomAppBarIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Icon(icon, size: 28)),
    );
  }
}
