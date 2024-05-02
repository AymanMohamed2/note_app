import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/note/cubit/note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/add_note_container.dart';
import 'package:note_app/widgets/custom_note_item.dart';

class NotesListBuilder extends StatefulWidget {
  const NotesListBuilder({super.key});

  @override
  State<NotesListBuilder> createState() => _NotesListBuilderState();
}

class _NotesListBuilderState extends State<NotesListBuilder> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) {
              List<NoteModel> notes =
                  BlocProvider.of<NoteCubit>(context).notes ?? [];
              return Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, top: 20),
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: ((context, index) {
                    return CustomNoteItem(
                      note: notes[index],
                    );
                  }),
                ),
              );
            },
          ),
        ),
        const AddNoteContainer(),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
