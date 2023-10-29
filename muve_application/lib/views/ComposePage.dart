// ignore: file_names
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;

class Compose extends StatelessWidget {
  const Compose({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () => context.push(routes.addExercisePath),
          child: const Text("Add Exercise")),
    );
  }
}
