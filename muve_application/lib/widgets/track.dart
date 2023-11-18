import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/models/track_model.dart';
import 'package:muve_application/viewmodels/compose_view_model.dart';
import 'package:provider/provider.dart';

class TrackElement extends StatelessWidget {
  final Track? track;

  const TrackElement({super.key, required this.track});

  @override
  Widget build(BuildContext context) {
    final composeVM = context.watch<ComposeViewModel>();

    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Remove Song"),
            content: const Text("Do you want to remove song from routine?"),
            actions: [
              TextButton(
                onPressed: () {
                  composeVM.removeTrack(track);
                  context.pop();
                },
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () => context.pop(),
                child: const Text("No"),
              )
            ],
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.height / 12,
              height: MediaQuery.of(context).size.height / 12,
              color: Colors.blueGrey,
            ),
            // const SizedBox(width: 10),
            Text('${track?.name}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('${track?.artist}'),
          ],
        ),
      ),
    );
  }
}
