import 'package:flutter/material.dart';
import 'package:second_note_app/Widgets/custom_app_bar.dart';
import 'package:second_note_app/Widgets/notes_list_view.dart';

class NotesScreenBody extends StatelessWidget {
  const NotesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 34),
          CustomAppBar(text: "Notes", icon: Icons.search),
          SizedBox(height: 16),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
