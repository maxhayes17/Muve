import 'package:flutter/material.dart';
import 'package:muve_application/models/exercise_model.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/viewmodels/compose_view_model.dart';
import 'package:muve_application/widgets/exercise_form.dart';
import 'package:provider/provider.dart';
import 'package:muve_application/routes.dart' as routes;

class AddExercisePage extends StatelessWidget {
  const AddExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    final composeVM = context.watch<ComposeViewModel>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add exercises'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: composeVM.newRoutine?.exercises.length,
                    itemBuilder: (context, index) {
                      Exercise? exercise =
                          composeVM.newRoutine?.exercises[index];
                      return Dismissible(
                        key: Key(exercise?.id.toString() as String),
                        onDismissed: (direction) =>
                            composeVM.removeExercise(exercise),
                        background: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(color: Colors.red),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: ExerciseForm(
                              index: index,
                            )),
                      );
                    }),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.only(top:20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.amber[900],
                    borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Text(
                      "Add Exercise",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                    ),
                ),
                onTap: () => composeVM.addExercise(),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.only(top:20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[700],
                    borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Text(
                      "Add Music",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                    ),
                  // ),
                ),
                onTap: () => context.push(routes.addMusicPath),
              ),
            ],
          ),
        ));
  }
}
