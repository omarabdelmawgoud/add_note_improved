import 'package:flutter/material.dart';
import 'package:second_note_app/Widgets/note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  final List<Color> colors =const [Colors.white];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: NoteCard(),
        );
      },
    );
  }
}
