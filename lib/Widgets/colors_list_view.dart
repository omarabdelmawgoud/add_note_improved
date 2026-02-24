import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_note_app/constants.dart';
import 'package:second_note_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});
  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38,
            child: CircleAvatar(backgroundColor: color, radius: 34),
          )
        : CircleAvatar(backgroundColor: color, radius: 38);
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2 * 38,
      child: ListView.builder(
        itemCount: kcolors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                BlocProvider.of<AddNoteCubit>(context).color =
                    kcolors[selectedIndex];
              },
              child: ColorItem(
                isSelected: index == selectedIndex,
                color: kcolors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}


