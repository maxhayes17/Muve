import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    final newRoutine = composeVM.newRoutine;

    return SafeArea(
      child: Column(
        children: [
          const Text("Compose Page"),
          // ComposeForm(routine: newRoutine),
          TextFormField(
          decoration: const InputDecoration(hintText: "Name"),
          onChanged: (value){
            composeVM.updateRoutineName(value);
          },
          ),
          Text('${composeVM.newRoutine.id}'),
          Text('${composeVM.newRoutine.name}'),
          ElevatedButton(
              onPressed: () => context.push(routes.addExercisePath + newRoutine.id.toString()),
              child: const Text("Add Exercise")),
          ElevatedButton(
              onPressed: () => context.push(routes.addMusicPath + newRoutine.id.toString()),
              child: const Text("Add Music")),
          ElevatedButton(
              onPressed: () {
                composeVM.saveRoutine(userId!);
                context.push(routes.homePath);
              },
              child: const Text("Create routine")),
        ],
      ),
    );
  }
}
