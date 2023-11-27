import 'package:flutter/material.dart';
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/widgets/Horizontal_routine_element.dart';
import 'package:muve_application/widgets/vertical_routine_element.dart';

class HorizontalRoutineList extends StatelessWidget {
  final List<Routine>? routines;

  const HorizontalRoutineList({super.key, required this.routines});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: routines?.length,
          itemBuilder: (context, index) {
            final routine = routines?[index];
            return HorizontalRoutineElement(routine: routine);
          }
      );
  }
}