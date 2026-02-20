import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_note_app/Models/note_model.dart';
import 'package:second_note_app/Widgets/colors_list_view.dart';
import 'package:second_note_app/Widgets/custom_button.dart';
import 'package:second_note_app/Widgets/custom_text_field.dart';
import 'package:second_note_app/constants.dart';
import 'package:second_note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:second_note_app/cubits/notes_cubit/notes_cubit.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Note',
            style: TextStyle(color: kcolor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hint: "Title",
            onsaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hint: "Content",
            maxlines: 3,
            onsaved: (value) {
              content = value;
            },
          ),
          const ColorsListView(),
          const SizedBox(height: 12),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isloading: state is AddNoteLoading,
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    NoteModel note = NoteModel(
                      Colors.blue.value,
                      title: title!,
                      content: content!,
                      date: DateTime.now().toString(),
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
