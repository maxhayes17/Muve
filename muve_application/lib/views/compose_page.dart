import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;

class ComposePage extends StatelessWidget {
  const ComposePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Text("Compose Page"),
          ElevatedButton(
              onPressed: () => context.push(routes.addExercisePath),
              child: const Text("Add Exercise")),
          ElevatedButton(
              onPressed: () => context.push(routes.addMusicPath),
              child: const Text("Add Music")),
        ],
      ),
    );
  }
}
