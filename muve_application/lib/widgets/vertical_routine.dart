import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/widgets/vertical_routine_element.dart';

class VerticalRoutine extends StatelessWidget {
  final List<Routine>? routines;

  const VerticalRoutine({super.key, required this.routines});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: routines?.length,
        itemBuilder: (context, index) {
          final routine = routines?[index];
          return VerticalRoutineElement(routine: routine);
        });
  }
}
