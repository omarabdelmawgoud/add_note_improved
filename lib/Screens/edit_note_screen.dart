import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_note_app/Models/note_model.dart';
import 'package:second_note_app/Widgets/custom_app_bar.dart';
import 'package:second_note_app/Widgets/custom_button.dart';
import 'package:second_note_app/Widgets/custom_text_field.dart';
import 'package:second_note_app/cubits/notes_cubit/notes_cubit.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  String? title, content;

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
              CustomAppBar(
                text: "Edit note",
                icon: Icons.close,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                hint: widget.note.title,
                onChanged: (value) {
                  title = value;
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                hint: widget.note.content,
                maxlines: 5,
                onChanged: (value) {
                  content = value;
                },
              ),
              SizedBox(height: 12),
              CustomButton(
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.content = content ?? widget.note.content;
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
