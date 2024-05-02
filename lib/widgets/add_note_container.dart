import 'package:flutter/material.dart';
import 'package:note_app/widgets/Add_Note_Container_Body.dart';

class AddNoteContainer extends StatelessWidget {
  const AddNoteContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 20),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const AddNoteContainerBody();
              });
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 47, 47, 47),
            borderRadius: BorderRadius.circular(20),
          ),
          width: double.infinity,
          height: 80,
          child: const Center(
            child: Icon(
              Icons.add,
              color: Color.fromARGB(255, 190, 184, 184),
            ),
          ),
        ),
      ),
    );
  }
}
