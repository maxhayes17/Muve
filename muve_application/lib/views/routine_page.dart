import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:muve_application/viewmodels/user_view_model.dart';
import 'package:muve_application/widgets/exercise.dart';
import 'package:muve_application/widgets/track.dart';
import 'package:provider/provider.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final routineVM = context.watch<RoutineViewModel>();
    final userVM = context.watch<UserViewModel>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Routine'),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5,
                // color: Colors.red,
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  // borderRadius: const BorderRadius.only(
                  //     bottomLeft: Radius.circular(10),
                  //     bottomRight: Radius.circular(10))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          // color: Colors.blueGrey,
                        ),
                        width: 128,
                        height: 128,
                        child: routineVM.currentRoutine!.picturePath != null &&
                                routineVM
                                    .currentRoutine!.picturePath!.isNotEmpty
                            ? Image.asset(
                                'assets/${routineVM.currentRoutine!.picturePath}')
                            : Image.asset('assets/Muve_routine_logo.png'),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text to the left
                        children: [
                          SizedBox(
                            width: 240,
                            child: Row(
                              children: [
                                Text(routineVM.currentRoutine!.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                                // SizedBox(width: 20,),
                                const Spacer(),
                                userVM.routineInLibrary(
                                        routineVM.currentRoutine!.id)
                                    ? const Icon(Icons.check_circle,
                                        color: Colors.orange)
                                    : IconButton(
                                        onPressed: () {
                                          userVM.addRoutineToLibrary(
                                              routineVM.currentRoutine!);
                                          context.push(routes.libraryPath);
                                        },
                                        icon: const Icon(Icons.add_circle,
                                            color: Colors.orange),
                                        tooltip: "Add",
                                      ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const ShareOptions());
                                  },
                                  icon: const Icon(Icons.send,
                                      color: Colors.white),
                                  tooltip: "Share",
                                ),
                              ],
                            ),
                          ),
                          Text(routineVM.currentRoutine!.author,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white70)),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: 45,
                              width: 240,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount:
                                      routineVM.currentRoutine!.tags.length,
                                  itemBuilder: (context, index) {
                                    final tag =
                                        routineVM.currentRoutine!.tags[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.orange[800],
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Text(
                                            tag,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                    );
                                  })),
                        ],
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: Row(children: [
                Container(
                  color: Colors.black26,
                  width: MediaQuery.of(context).size.width * 0.75,
                  // height: 500,
                  padding: const EdgeInsets.only(top: 20),
                  // color: Colors.red,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: routineVM.currentRoutine!.exercises.length,
                      itemBuilder: (context, index) {
                        final exercise =
                            routineVM.currentRoutine!.exercises[index];
                        return Padding(
                            padding: const EdgeInsets.only(
                                left: 20, bottom: 20, right: 20),
                            child: ExerciseCard(exercise: exercise));
                      }),
                ),
                Container(
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width * 0.25,
                  // color: Colors.blue,
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: routineVM.currentRoutine!.tracks.length,
                      itemBuilder: (context, index) {
                        final track = routineVM.currentRoutine!.tracks[index];
                        return Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TrackElement(
                              track: track,
                            ));
                      }),
                ),
              ]),
            ),
          ]),
        ));
  }
}

class ShareOptions extends StatelessWidget {
  const ShareOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final routineVM = context.watch<RoutineViewModel>();

    return AlertDialog(
      backgroundColor: Colors.black,
      title: const Text("Share Routine"),
      content: const Text("How would you like to share this routine?"),
      actions: [
        // TextButton(
        //   onPressed: () => context.pop(),
        //   child: const Text(
        //     "Cancel",
        //     style: TextStyle(color: Colors.red),
        //   ),
        // ),
        FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white10,
            ),
            onPressed: () {
              routineVM.sendSMS();
              context.pop();
            },
            child: const Text("Send SMS", style: TextStyle(color: Colors.orangeAccent),)),
        FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white10
            ),
            onPressed: () {
              routineVM.saveToClipboard();
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Copied to clipboard")));
            },
            child: const Text("Copy to clipboard", style: TextStyle(color: Colors.orangeAccent),)),
      ],
    );
  }
}
