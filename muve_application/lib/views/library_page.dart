import 'package:flutter/material.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:muve_application/viewmodels/user_view_model.dart';
import 'package:muve_application/widgets/vertical-routine-add.dart';
import 'package:muve_application/widgets/vertical_routine.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routineVM = context.read<RoutineViewModel>();
    final userVM = context.read<UserViewModel>();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 32, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
          children: [
            SizedBox(height: 24,),
            const Text("Your routines", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 12,),
            VerticalRoutineAdd(),
            Expanded(
              child: VerticalRoutine(routines: userVM.routines),
              )
          ]
        ),
      )
    );
  }
}
