import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/models/routine_model.dart';

class VerticalRoutine extends StatelessWidget {
  final List<Routine>? routines;

  const VerticalRoutine({super.key, required this.routines});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: routines?.length,
        itemBuilder: (context, index) {
          final routine = routines?[index];
          return ListTile(
            contentPadding: const EdgeInsets.all(10),
            title: Text(routine!.name),
            subtitle: Text(routine.duration),
            trailing: Text(routine.author),
            onTap: () => context.push(routes.routinePath),
          );
        });
  }
}
