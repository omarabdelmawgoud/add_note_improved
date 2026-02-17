part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesSuccess extends NotesState {
  final List<NoteModel> notes ;

  NotesSuccess({required this.notes});
}

final class NotesFailure extends NotesState {
  final String errorMessagel;

  NotesFailure({required this.errorMessagel});
}

final class NotesLoading extends NotesState {}
