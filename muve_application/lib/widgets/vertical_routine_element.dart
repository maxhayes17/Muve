import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:provider/provider.dart';

class VerticalRoutineElement extends StatelessWidget {
  final Routine? routine;

  const VerticalRoutineElement({super.key, required this.routine});

  @override
  Widget build(BuildContext context) {
    final routineVM = context.watch<RoutineViewModel>();

    return GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.height / 12,
                height: MediaQuery.of(context).size.height / 12,
                color: Colors.blueGrey,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text(routine!.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(routine!.duration),
                  Text(routine!.author),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          routineVM.setRoutineById(routine!.id);
          context.push(routes.routinePath);
        });
  }
}

    // return ListTile(
    //   contentPadding: const EdgeInsets.all(10),
    //   title: Text(routine!.name),
    //   subtitle: Text(routine.duration),
    //   trailing: Text(routine.author),
    //   onTap: () => context.push(routes.routinePath),
    // );