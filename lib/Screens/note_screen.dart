import 'package:flutter/material.dart';
import 'package:second_note_app/Widgets/add_note_bottomsheet.dart';
import 'package:second_note_app/Widgets/notes_screen_body.dart';
import 'package:second_note_app/constants.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: NotesScreenBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: const Color.fromARGB(255, 38, 33, 33),
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddNoteBottomSheet(),
                );
              },
            );
          },
          backgroundColor: kcolor,
          shape: CircleBorder(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
