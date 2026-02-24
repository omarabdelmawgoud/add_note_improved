import 'package:flutter/material.dart';
import 'package:second_note_app/Models/note_model.dart';
import 'package:second_note_app/Widgets/colors_list_view.dart';
import 'package:second_note_app/constants.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  bool isSelected = false;
  late int selectedIndex;
  @override
  void initState() {
    selectedIndex = kcolors.indexWhere((c) => c.value == widget.note.color);
    if (selectedIndex == -1) selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2 * 38,
      child: ListView.builder(
        itemCount: kcolors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.note.color = kcolors[selectedIndex].value;
                });
              },
              child: ColorItem(
                isSelected: index == selectedIndex,
                color: kcolors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
