import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/models/track_model.dart';

class TrackElement extends StatelessWidget {
  final Track? track;

  const TrackElement({super.key, required this.track});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16)),
            Text('${track?.artist}'),
          ],
        ),
      );
  }
}
