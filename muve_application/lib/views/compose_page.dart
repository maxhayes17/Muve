import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/viewmodels/compose_view_model.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:muve_application/viewmodels/user_view_model.dart';
import 'package:provider/provider.dart';

class ComposePage extends StatelessWidget {
  const ComposePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userVM = context.read<UserViewModel>();
    final currentUser = userVM.user;
    // final userId = userVM.id;
    final composeVM = context.watch<ComposeViewModel>();
    if (composeVM.newRoutine == null){
      composeVM.createRoutine(currentUser);
    }
    // Routine? newRoutine = composeVM.newRoutine;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24,),
            const Text("Create routine",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
              ),
            // SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              // color: Colors.red,
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
                      ],
                    ),
                  ],
                ),
                ),
            //),
            SizedBox(height: 128,),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    child: FilledButton(
                      style: FilledButton.styleFrom(backgroundColor: Colors.blueGrey[700]),
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
                      style: FilledButton.styleFrom(backgroundColor: Colors.blueGrey[700]),
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
                    height: 70,
                    child: FilledButton(
                      style: FilledButton.styleFrom(backgroundColor: Colors.amber[900]),
                      onPressed: () {
                        composeVM.saveRoutine(currentUser);
                        context.push(routes.homePath);
                      },
                      child: const Text(
                        "Create routine",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    ),
              ]
              ),
            ),
          ],
        ),
      )
    );
  }
}
