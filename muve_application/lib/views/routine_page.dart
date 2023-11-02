import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;

class RoutinePage extends StatelessWidget {
  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Routine'),
        ),
        body: Column(children: [
          const Text("Routine Page"),
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