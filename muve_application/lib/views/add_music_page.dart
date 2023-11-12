import 'package:flutter/material.dart';
import 'package:muve_application/models/exercise_model.dart';
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/models/set_model.dart';
import 'package:muve_application/models/track_model.dart';
import 'package:muve_application/viewmodels/compose_view_model.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:muve_application/widgets/exercise.dart';
import 'package:muve_application/widgets/track.dart';
import 'package:provider/provider.dart';

class AddMusicPage extends StatelessWidget {
  // final int id;

  const AddMusicPage({super.key});

  @override
  Widget build(BuildContext context) {

    final composeVM = context.watch<ComposeViewModel>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add music'),
        ),
        body: SafeArea(
          child: Column(children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5,
                // color: Colors.red,

                /*
                Searchbar and results would go here;
                * Search results should show up as a clickable track element (like the one below) 
                
                 */
                child: Column(
                  children: [
                    GestureDetector(
                      child: TrackElement(track: composeVM.newRoutine?.tracks?[0]),
                      onTap: () => composeVM.addTrack(),
                    )
                  ]
                ),
            ),
            Row(children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 500,
                // color: Colors.red,
                child: ListView.builder(
                    itemCount: composeVM.newRoutine?.exercises?.length,
                    itemBuilder: (context, index) {
                      final exercise = composeVM.newRoutine?.exercises?[index];
                      return Padding(
                          padding: const EdgeInsets.only(left:20, bottom: 20),
                          child: ExerciseCard(exercise: exercise)
                        );
                    }),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                // color: Colors.blue,
                height: 500,
                child: ListView.builder(
                    itemCount: composeVM.newRoutine?.tracks?.length,
                    itemBuilder: (context, index) {
                      final track = composeVM.newRoutine?.tracks?[index];
                      return Padding(
                          padding: const EdgeInsets.only(),
                          child: TrackElement(track: track,)
                        );
                    }),
              ),
            ]),
          ]),
        ));
  }
}
