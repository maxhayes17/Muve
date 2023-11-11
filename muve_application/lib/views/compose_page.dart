import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/viewmodels/compose_view_model.dart';
import 'package:muve_application/viewmodels/user_view_model.dart';
import 'package:muve_application/widgets/compose_form.dart';
import 'package:provider/provider.dart';

class ComposePage extends StatelessWidget {
  const ComposePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userVM = context.read<UserViewModel>();
    final userId = userVM.id;
    final composeVM = context.watch<ComposeViewModel>();
    Routine? newRoutine = composeVM.newRoutine;

    return SafeArea(
      child: Column(
        children: [
          SizedBox(width: MediaQuery.of(context).size.height / 10,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            // color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Container(
                    width: 128,
                    height: 128,
                    color: Colors.blueGrey,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Container(
                        width: 128,
                        child: TextFormField(
                          decoration: const InputDecoration(hintText: "Name"),
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          onChanged: (value){
                            composeVM.updateRoutineName(value);
                          },
                        ),
                      ),
                      // Text(newRoutine.duration,
                      //     style: const TextStyle(fontSize: 16)),
                      // Text(newRoutine.author,
                      //     style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              )
          ),
          SizedBox(height: 128,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            child: FilledButton(
              onPressed: () => context.push(routes.addExercisePath),
              child: const Text(
                "Add Exercises",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 32,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            child: FilledButton(
              onPressed: () => context.push(routes.addMusicPath),
              child: const Text(
                "Add Music",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 128,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            child: FilledButton(
              onPressed: () {
                composeVM.saveRoutine(userId!);
                context.push(routes.homePath);
              },
              child: const Text(
                "Create routine",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
