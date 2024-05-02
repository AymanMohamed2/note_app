import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note/add_note_cubit.dart';
import 'package:note_app/cubits/note/cubit/note_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';
import 'package:note_app/widgets/custom_snake_bar.dart';

class AddNoteContainerBody extends StatelessWidget {
  const AddNoteContainerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteError) {
            customSnakeBar(
              context,
              text: 'there was an error',
              color: Colors.red,
            );
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NoteCubit>(context).fetchAllNotes();
            Navigator.pop(context);
            customSnakeBar(
              context,
              text: 'Note added successfully',
              color: Colors.green,
            );
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
