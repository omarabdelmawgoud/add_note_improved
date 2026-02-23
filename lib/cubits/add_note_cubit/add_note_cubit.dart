import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:second_note_app/Models/note_model.dart';
import 'package:second_note_app/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = Colors.red;

  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    try {
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
