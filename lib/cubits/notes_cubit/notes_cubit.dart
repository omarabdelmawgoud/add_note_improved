import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:second_note_app/Models/note_model.dart';
import 'package:second_note_app/constants.dart';

part 'notes_state.dart';

class ViewNoteCubit extends Cubit<NotesState> {
  ViewNoteCubit() : super(NotesInitial());

  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    try {
      emit(NotesSuccess(notes: notesBox.values.toList()));
    } catch (e) {
      emit(NotesFailure(errorMessage: e.toString()));
    }
  }
}
