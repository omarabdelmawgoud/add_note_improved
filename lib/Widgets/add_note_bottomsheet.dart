import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:second_note_app/Widgets/add_note_form.dart';
import 'package:second_note_app/cubits/add_note_cubit/add_note_cubit.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print("Failure");
          } else {
            Navigator.of(context).pop();
          }
        },
        child: ModalProgressHUD(
          inAsyncCall: State is AddNoteLoading ? true : false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(child: AddNoteForm()),
          ),
        ),
      ),
    );
  }
}
