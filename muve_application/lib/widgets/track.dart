import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/models/track_model.dart';
import 'package:muve_application/viewmodels/compose_view_model.dart';
import 'package:provider/provider.dart';

// Infinite text scroll


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
            backgroundColor: Colors.black,
            title: const Text("Remove Song"),
            content: const Text("Would you like to remove this song?"),
            actions: [
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white10
                ),
                onPressed: () {
                  composeVM.removeTrack(track);
                  context.pop();
                },
                child: const Text("Yes", style: TextStyle(color: Colors.orangeAccent),),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.orange[700]
                ),
                onPressed: () => context.pop(),
                child: const Text("No", style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.height / 12,
              height: MediaQuery.of(context).size.height / 12,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.white12,
                ),
                child: track!.picturePath != null
                        && track!.picturePath!.isNotEmpty
                          ? Image.network('${track!.picturePath}')
                          : const SizedBox(),
            ),
            const SizedBox(height: 4),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text('${track?.name}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16,)
                      ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text('${track?.artist}'),
            ),
          ],
        ),
      ),
    );
  }
}
