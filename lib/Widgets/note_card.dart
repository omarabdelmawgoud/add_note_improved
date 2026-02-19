import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:second_note_app/Models/note_model.dart';
import 'package:second_note_app/Screens/edit_note_screen.dart';
import 'package:second_note_app/cubits/notes_cubit/notes_cubit.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    final DateTime? dt = DateTime.tryParse(noteModel.date);
    final String displayDate = dt != null
        ? DateFormat('dd MMM yyyy').format(dt)
        : noteModel.date;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditNoteScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 16, top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    noteModel.title,
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
                subtitle: Text(
                  noteModel.content,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    noteModel.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: Icon(
                    FontAwesomeIcons.trash,
                    size: 32,
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 24, top: 12),
                child: Text(
                  displayDate,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
