import 'package:flutter/material.dart';
import 'package:muve_application/models/exercise_model.dart';
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/models/set_model.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:muve_application/widgets/exercise_form.dart';
import 'package:provider/provider.dart';

class AddExercisePage extends StatelessWidget {

  final int id;
  const AddExercisePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {

    final routineVM = context.read<RoutineViewModel>();
    final routine = routineVM.getRoutineById(id);

    List<Exercise> newExerciseList = [Exercise(id: 0)];

    return Scaffold(

      appBar: AppBar(
        title: const Text('Add exercise'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ExerciseForm(),
            // ListView.builder(
            //           itemCount: newExerciseList.length,
            //           itemBuilder: (context, index) {
            //             Exercise? exercise = newExerciseList[index];
            //             return Padding(
            //                 padding: const EdgeInsets.only(left:20, bottom: 20),
            //                 child: Container(color: Colors.red, height: 50,)
            //               );
            //   }),
              // ElevatedButton(
              //   onPressed: () { 
              //     setState(){
              //    newExerciseList.add(Exercise(id: 1)); 
              //   }},
              //   child: const Text("Add Exercise")
              // ),
            
          ],)
      )
    );
  }
}
