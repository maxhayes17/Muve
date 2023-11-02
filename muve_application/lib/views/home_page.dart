import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Text("Home Page"),
          ElevatedButton(
              onPressed: () => context.push(routes.routinePath),
              child: const Text("Routine")),
        ],
      ),
    );
  }
}
