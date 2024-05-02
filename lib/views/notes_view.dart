import 'package:flutter/material.dart';
import 'package:note_app/widgets/notes_list_builder.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes App'),
        centerTitle: true,
      ),
      body: const NotesListBuilder(),
    );
  }
}
