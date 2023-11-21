import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:muve_application/widgets/exercise.dart';
import 'package:muve_application/widgets/track.dart';
import 'package:provider/provider.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final routineVM = context.watch<RoutineViewModel>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Routine'),
        ),
        body: SafeArea(
          child: Column(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5,
                // color: Colors.red,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 128,
                        height: 128,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text to the left
                        children: [
                          Container( 
                            width: 240,
                            child:
                              Row(children: [
                                Text(routineVM.currentRoutine!.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20)
                                ),
                                // SizedBox(width: 20,),
                                Spacer(),
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
                          ),
                          Text(routineVM.currentRoutine!.author,
                              style: const TextStyle(fontSize: 16)),
                          SizedBox(height: 10,),
                          Container(
                            height: 45,
                            width: 240,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: routineVM.currentRoutine!.tags.length,
                              itemBuilder: (context, index){
                                final tag = routineVM.currentRoutine!.tags[index];
                                return Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey[700],
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text('${tag}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)
                                  ),
                                );
                              }
                              
                            )
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 500,
                // color: Colors.red,
                child: ListView.builder(
                    itemCount: routineVM.currentRoutine!.exercises.length,
                    itemBuilder: (context, index) {
                      final exercise =
                          routineVM.currentRoutine!.exercises[index];
                      return Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: ExerciseCard(exercise: exercise));
                    }),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                // color: Colors.blue,
                height: 500,
                child: ListView.builder(
                    itemCount: routineVM.currentRoutine!.tracks.length,
                    itemBuilder: (context, index) {
                      final track = routineVM.currentRoutine!.tracks[index];
                      return Padding(
                          padding: const EdgeInsets.only(),
                          child: TrackElement(
                            track: track,
                          ));
                    }),
              ),
            ]),
          ]),
        ));
  }
}
