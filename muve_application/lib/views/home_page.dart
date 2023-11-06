import 'package:flutter/material.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:muve_application/viewmodels/user_view_model.dart';
import 'package:muve_application/widgets/vertical_routine.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final routineVM = context.read<RoutineViewModel>();
    final userVM = context.read<UserViewModel>();

    return SafeArea(
      child: Column(children: [
        const Text("Recent Routines"),
        Expanded(
            child:
                VerticalRoutine(routines: routineVM.routinesById(userVM.id))),
      ]),
    );
  }
}
