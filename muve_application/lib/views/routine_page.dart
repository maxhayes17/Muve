import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:provider/provider.dart';

class RoutinePage extends StatelessWidget {
  final int id;

  const RoutinePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final routineVM = context.read<RoutineViewModel>();
    final routine = routineVM.getRoutineById(id);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Routine'),
        ),
        body: Column(children: [
          Text("Routine ${routine.id} Page"),
          Row(children: [
            IconButton(
              onPressed: () => context.push(routes.sharePath),
              icon: const Icon(Icons.send),
              tooltip: "Share",
            ),
            const Text("Share")
          ])
        ]));
  }
}

          // ElevatedButton(
          //     onPressed: () => context.push(routes.sharePath),
          //     child: const Text("Share"))