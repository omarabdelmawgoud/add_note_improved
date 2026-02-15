import 'package:flutter/material.dart';
import 'package:second_note_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,this.onsaved});
  final void Function()? onsaved;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: kcolor),
      onPressed: onsaved,
      child: const Text('Save', style: TextStyle(color: Colors.black)),
    );
  }
}
