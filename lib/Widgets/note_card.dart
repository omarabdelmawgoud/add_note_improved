import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:second_note_app/Screens/edit_note_screen.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditNoteScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffFFCC80),
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
                    "Studying flutter ",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
                subtitle: Text(
                  "Studying flutter for 2hours at least daily Build your carrer with Omar Abdelmawgod he is the best in flutter .",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
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
                  "10 Jan,2004",
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
