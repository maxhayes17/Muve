import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:provider/provider.dart';

class HorizontalRoutineElement extends StatelessWidget {
  final Routine? routine;

  const HorizontalRoutineElement({super.key, required this.routine});

  @override
  Widget build(BuildContext context) {
    final routineVM = context.watch<RoutineViewModel>();
    return GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(top:10, right: 20),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.height / 12,
                height: MediaQuery.of(context).size.height / 12,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: routine!.picturePath != null
                        && routine!.picturePath!.isNotEmpty
                          ? Image.asset('assets/${routine!.picturePath}')
                          : Image.asset('assets/Muve_routine_logo.png'),
              ),
              const SizedBox(height: 10),
              Text(
                routine!.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 16
                )
              ),
              Text(routine!.author),
            ],
          ),
        ),
        onTap: () {
          routineVM.setRoutineById(routine!.id);
          context.push(routes.routinePath);
        });
  }
}