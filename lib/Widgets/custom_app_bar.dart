import 'package:flutter/material.dart';
import 'package:second_note_app/Widgets/custom_app_bar_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8),
        Text(text, style: TextStyle(fontSize: 28, color: Colors.white)),
        Spacer(),
        CustomAppBarIcon(icon: icon),
      ],
    );
  }

//   ElevatedButton customBackButton(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//       child: Icon(Icons.arrow_back, size: 18),
//     );
//   }
}
