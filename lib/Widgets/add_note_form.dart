import 'package:flutter/material.dart';
import 'package:second_note_app/Widgets/custom_button.dart';
import 'package:second_note_app/Widgets/custom_text_field.dart';
import 'package:second_note_app/constants.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Note',
            style: TextStyle(color: kcolor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hint: "Title",
            onsaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hint: "Content",
            maxlines: 3,
            onsaved: (value) {
              content = value;
            },
          ),
          const SizedBox(height: 12),
          CustomButton(
            onsaved: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                Navigator.of(context).pop();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
