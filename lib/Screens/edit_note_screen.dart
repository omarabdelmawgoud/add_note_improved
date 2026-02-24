import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_note_app/Models/note_model.dart';
import 'package:second_note_app/Widgets/custom_app_bar.dart';
import 'package:second_note_app/Widgets/custom_button.dart';
import 'package:second_note_app/Widgets/custom_text_field.dart';
import 'package:second_note_app/Widgets/edit_note_colors_list.dart';
import 'package:second_note_app/cubits/notes_cubit/notes_cubit.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

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
                controller: titleController,
                hint: "Title",
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: contentController,
                hint: "Content",
                maxlines: 5,
                onChanged: (value) {},
              ),
              SizedBox(height: 12),
              EditNoteColorList(note: widget.note,),
              SizedBox(height: 12),
              CustomButton(
                onPressed: () {
                  widget.note.title = titleController.text;
                  widget.note.content = contentController.text;
                  widget.note.save();
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
