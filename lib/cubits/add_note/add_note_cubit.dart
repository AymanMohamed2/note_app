import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:note_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = const Color.fromARGB(255, 9, 164, 195);

  addNote(NoteModel notes) async {
    notes.color = color.value;
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>('NotesBox');
      await noteBox.add(notes);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteError(errorMessage: e.toString()));
    }
  }
}
