import 'package:flutter/material.dart';
import 'package:second_note_app/constants.dart';

class CustomAppBarIcon extends StatelessWidget {
  const CustomAppBarIcon({super.key, required this.icon, this.onPressed});
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: kcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: IconButton(
          icon: Icon(icon, size: 24, color: Colors.black),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
