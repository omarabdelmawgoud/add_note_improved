import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_note_app/Models/note_model.dart';
import 'package:second_note_app/Widgets/note_card.dart';
import 'package:second_note_app/cubits/notes_cubit/notes_cubit.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  final List<Color> colors=[];
  @override
  void initState() {
    super.initState();

    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel>? noteslist =
            BlocProvider.of<NotesCubit>(context).notes?.toList() ?? [];

        return ListView.builder(
          reverse: true,
          dragStartBehavior: DragStartBehavior.down,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: noteslist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: NoteCard(noteModel: noteslist[index]),
            );
          },
        );
      },
    );
  }
}
