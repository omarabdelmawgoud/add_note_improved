import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:second_note_app/Models/note_model.dart';

part 'notes_state.dart';

class ViewNoteCubit extends Cubit<NotesState> {
  ViewNoteCubit() : super(NotesInitial());
}
