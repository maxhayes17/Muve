import 'package:flutter/material.dart';
import 'package:muve_application/viewmodels/user_view_model.dart';
import 'package:muve_application/widgets/vertical_routine_add.dart';
import 'package:muve_application/widgets/vertical_routine_list.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userVM = context.read<UserViewModel>();

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the left
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text("Your routines",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 12,
            ),
            const VerticalRoutineAdd(),
            Expanded(
              child: VerticalRoutineList(routines: userVM.routines),
            )
          ]),
    ));
  }
}
