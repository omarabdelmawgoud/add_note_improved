import 'package:flutter/material.dart';
import 'package:second_note_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxlines = 1, this.onsaved, this.onChanged,
  });
  final String hint;
  final int maxlines;
  final void Function(String?)? onsaved;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "field is required";
        } else {
          return null;
        }
      },

      style: TextStyle(color: Colors.white),
      cursorColor: kcolor,
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: makeBoarder(),
        focusedBorder: makeBoarder(boarderColor: kcolor),
        errorBorder: makeBoarder(boarderColor: Colors.red),
        focusedErrorBorder: makeBoarder(boarderColor: Colors.red),
      ),
    );
  }

  OutlineInputBorder makeBoarder({Color? boarderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: boarderColor ?? Colors.white),
    );
  }
}
