import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isPicked, required this.color});

  final bool isPicked;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isPicked
        ? Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: CircleAvatar(
                backgroundColor: color,
                radius: 27,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: color,
              radius: 27,
            ),
          );
  }
}

class ColorItemList extends StatefulWidget {
  const ColorItemList({super.key});

  @override
  State<ColorItemList> createState() => _ColorItemListState();
}

int currentIndex = 0;

List<Color> colors = const [
  Color.fromARGB(255, 207, 23, 84),
  Color.fromARGB(255, 112, 58, 219),
  Color.fromARGB(255, 224, 161, 13),
  Color.fromARGB(255, 9, 164, 195),
  Color.fromARGB(255, 41, 206, 29),
  Color.fromARGB(255, 213, 228, 7),
  Color.fromARGB(255, 207, 207, 207),
];

class _ColorItemListState extends State<ColorItemList> {
  @override
  void initState() {
    BlocProvider.of<AddNoteCubit>(context).color = colors[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                setState(() {});
              },
              child: ColorItem(
                color: colors[index],
                isPicked: currentIndex == index,
              ),
            );
          }),
    );
  }
}
