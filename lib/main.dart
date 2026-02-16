import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_note_app/Models/note_model.dart';
import 'package:second_note_app/Screens/note_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:second_note_app/constants.dart';
import 'package:second_note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:second_note_app/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff2E2E2E),
        fontFamily: "Poppins",
      ),
      home: NoteScreen(),
    );
  }
}
