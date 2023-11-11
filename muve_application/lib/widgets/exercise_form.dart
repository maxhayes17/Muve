import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/models/exercise_model.dart';
import 'package:muve_application/routes.dart' as routes;
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      color: Colors.red,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: newExerciseList.length,
              itemBuilder: (context, index) {
                Exercise? exercise = newExerciseList[index];
                return Padding(
                    padding: const EdgeInsets.all(20),
                    child: ExerciseFormElement(exercise: exercise,)
                  );
              }),
          ),
          ElevatedButton(
          onPressed: () { 
            setState((){
              newExerciseList.add(Exercise(id: 1)); 
          });
          },
          child: const Text("Add Exercise")
        ),
        ],
      ),
    );
  }
}