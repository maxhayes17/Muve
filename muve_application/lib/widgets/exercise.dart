import 'package:flutter/material.dart';
import 'package:muve_application/models/exercise_model.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise? exercise;

  const ExerciseCard({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.blueGrey[300]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          exercise!.name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(), // Disable ListView scrolling
            itemCount: exercise!.sets?.length,
            itemBuilder: (context, index) {
              final set = exercise!.sets![index];
              return Row(
                children: [
                  Text(
                    '${(index + 1)}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  set.weight != null
                      ? Text(
                          '${set.weight} lbs',
                          style: const TextStyle(fontSize: 16),
                        )
                      : const SizedBox(
                          width: 0,
                        ),
                  const SizedBox(
                    width: 25,
                  ),
                  set.repetitions != null
                      ? Text(
                          '${set.repetitions} reps',
                          style: const TextStyle(fontSize: 16),
                        )
                      : const SizedBox(
                          width: 0,
                        ),
                  const SizedBox(
                    width: 25,
                  ),
                  set.duration != null
                      ? Text(
                          '${set.duration}',
                          style: const TextStyle(fontSize: 16),
                        )
                      : const SizedBox(
                          width: 0,
                        ),
                ],
              );
            })
      ]),
    );
  }
}
