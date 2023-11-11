import 'package:flutter/material.dart';
import 'package:muve_application/models/exercise_model.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/models/set_model.dart';
import 'package:muve_application/viewmodels/compose_view_model.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:muve_application/widgets/exercise_form.dart';
import 'package:provider/provider.dart';
import 'package:muve_application/routes.dart' as routes;

class AddExercisePage extends StatelessWidget {

  final int id;
  const AddExercisePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {

    final routineVM = context.read<RoutineViewModel>();
    final composeVM = context.watch<ComposeViewModel>();
    final routine = routineVM.getRoutineById(id);

    List<Exercise> newExerciseList = [Exercise(id: 0)];

    return Scaffold(

      appBar: AppBar(
        title: const Text('Add exercise'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('${composeVM.newRoutine.name}'),
            ExerciseForm(),
            ElevatedButton(
              onPressed: () => context.push(routes.addMusicPath + id.toString()),
              child: const Text("Add Music")),
            
          ],)
      )
    );
  }
}
