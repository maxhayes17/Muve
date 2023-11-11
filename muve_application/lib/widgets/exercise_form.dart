import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/models/exercise_model.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/viewmodels/compose_view_model.dart';
import 'package:muve_application/widgets/exercise_form_element.dart';
import 'package:provider/provider.dart';

class ExerciseForm extends StatefulWidget {
  const ExerciseForm({super.key});

  @override
  State<ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
List<Exercise> newExerciseList = [Exercise(id: 0)];
// final List<String> newExerciseList = ["a", "b"];
  @override
  Widget build(BuildContext context) {

    final composeVM = context.watch<ComposeViewModel>();

    // List<Exercise>? exercises = composeVM.newRoutine.exercises;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      // color: Colors.red,
      child: Column(
        children: [
          Text('${composeVM.newRoutine.exercises?.length}'),
          Expanded(
            child: ListView.builder(
              itemCount: composeVM.newRoutine.exercises?.length,
              itemBuilder: (context, index) {
                Exercise? exercise = composeVM.newRoutine.exercises?[index];
                return Padding(
                    padding: const EdgeInsets.all(20),
                    child: ExerciseFormElement(index: index,)
                  );
              }),
          ),
          ElevatedButton(
          onPressed: () {
            composeVM.addExercise();
          //   setState((){
          //     newExerciseList.add(Exercise(id: 1)); 
          // });
          },
          child: const Text("Add Exercise")
        ),
        ],
      ),
    );
  }
}