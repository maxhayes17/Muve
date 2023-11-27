import 'package:flutter/material.dart';
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/widgets/vertical_routine_element.dart';

class VerticalRoutineList extends StatelessWidget {
  final List<Routine>? routines;

  const VerticalRoutineList({super.key, required this.routines});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // Disable ListView scrolling
            itemCount: routines?.length,
            itemBuilder: (context, index) {
              final routine = routines?[index];
              return VerticalRoutineElement(routine: routine);
            }
          )
        );
  }
}
