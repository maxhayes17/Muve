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
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5,
                // color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(width: 128, height: 128, color: Colors.blueGrey,),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text to the left
                        children: [
                          Text(routine.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(routine.duration,
                              style: const TextStyle(
                                      fontSize: 16)),
                          Text(routine.author,
                              style: const TextStyle(
                                      fontSize: 16)),
                        ],
                      ),
                      SizedBox(width: 20,),
                      IconButton(
                        onPressed: () => context.push(routes.libraryPath),
                        icon: const Icon(Icons.add_circle_outline_rounded),
                        tooltip: "Add",
                      ),
                      IconButton(
                        onPressed: () => context.push(routes.sharePath),
                        icon: const Icon(Icons.send),
                        tooltip: "Share",
                      ),
                    ],
                  ),
                )
              )
            ]
          ),
        )
      );
  }
}

// Column(children: [
//           Text("Routine ${routine.id} Page"),
//           Row(children: [
//             IconButton(
//               onPressed: () => context.push(routes.sharePath),
//               icon: const Icon(Icons.send),
//               tooltip: "Share",
//             ),
//             const Text("Share")
//           ])
//         ]));
          // ElevatedButton(
          //     onPressed: () => context.push(routes.sharePath),
          //     child: const Text("Share"))