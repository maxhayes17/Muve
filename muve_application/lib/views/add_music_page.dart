import 'package:flutter/material.dart';
import 'package:muve_application/models/track_model.dart';
import 'package:muve_application/viewmodels/compose_view_model.dart';
import 'package:muve_application/widgets/exercise.dart';
import 'package:muve_application/widgets/track.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/viewmodels/user_view_model.dart';
import 'package:muve_application/routes.dart' as routes;

class AddMusicPage extends StatelessWidget {
  // final int id;

  const AddMusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userVM = context.read<UserViewModel>();
    final currentUser = userVM.user;
    final composeVM = context.watch<ComposeViewModel>();

    List<Track>? trackSearchResults = composeVM.trackSearchResults;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add music'),
        ),
        body: SafeArea(
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height / 4,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[800],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.white,),
                      SizedBox(width: 10,),
                      Expanded(
                        child: TextField(
                          onSubmitted: (value) {
                            if (value.isNotEmpty) {
                            composeVM.searchTracks(value);
                            // routineVM.searchRoutineTags(value);
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              hintText: "Search Tracks...",
                              hintStyle: TextStyle(color: Colors.white70),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                trackSearchResults!.isNotEmpty
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height / 6,
                        // color: Colors.red,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: trackSearchResults.length,
                            itemBuilder: (context, index) {
                              final track = trackSearchResults[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 20),
                                child: GestureDetector(
                                  child: TrackElement(track: track),
                                  onTap: () => composeVM.addTrack(track),
                                ),
                              );
                            }),
                      )
                    : const SizedBox(),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 500,
                  // color: Colors.red,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: composeVM.newRoutine?.exercises.length,
                      itemBuilder: (context, index) {
                        final exercise = composeVM.newRoutine?.exercises[index];
                        return Padding(
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 20),
                            child: ExerciseCard(exercise: exercise));
                      }),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  // color: Colors.blue,
                  height: 500,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: composeVM.newRoutine?.tracks.length,
                      itemBuilder: (context, index) {
                        final track = composeVM.newRoutine?.tracks[index];
                        return Padding(
                            padding: const EdgeInsets.only(),
                            child: TrackElement(
                              track: track,
                            ));
                      }),
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 70,
              child: FilledButton(
                style:
                    FilledButton.styleFrom(backgroundColor: Colors.amber[900]),
                onPressed: () {
                  composeVM.saveRoutine(currentUser);
                  context.push(routes.homePath);
                },
                child: const Text(
                  "Create routine",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
          ]),
        ));
  }
}
