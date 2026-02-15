import 'package:flutter/material.dart';
import 'package:second_note_app/Widgets/custom_app_bar.dart';
import 'package:second_note_app/Widgets/custom_button.dart';
import 'package:second_note_app/Widgets/custom_text_field.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 34),
              CustomAppBar(text: "Edit note", icon: Icons.check),
              SizedBox(height: 16),
              CustomTextField(hint: "Title"),
              SizedBox(height: 16),
              CustomTextField(hint: "Content", maxlines: 5),
              SizedBox(height: 12),
              CustomButton(),
            ],
          ),
        ),
      ),
    );
  }
}
