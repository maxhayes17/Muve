import 'package:flutter/material.dart';
import 'package:muve_application/models/exercise_model.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise? exercise;

  const ExerciseCard({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.blueGrey[900]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Colors.blueGrey[800]
            ),
          child: Text(
            exercise?.name ?? '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 10, top:10, bottom: 20),
            child: ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable ListView scrolling
              itemCount: exercise?.sets.length,
              itemBuilder: (context, index) {
                final set = exercise?.sets[index];
                return Padding(
                  padding: const EdgeInsets.only(top:5, bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        '${(index + 1)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      set?.weight != null
                          ? RichText(
                            text: TextSpan(
                              text: '${set?.weight}', 
                              style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                              children: const [
                                TextSpan(text: ' lbs', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal))
                              ]
                              )
                            )
                          : const SizedBox(),
                      const SizedBox(
                        width: 25,
                      ),
                      set?.repetitions != null
                          ? RichText(
                            text: TextSpan(
                              text: '${set?.repetitions}', 
                              style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                              children: const [
                                TextSpan(text: ' reps', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))
                              ]
                              )
                            )
                          : const SizedBox(),
                      // const SizedBox(
                      //   width: 25,
                      // ),
                      Spacer(),
                      set?.duration != null
                          ? Text(
                              '${set?.duration}',
                              style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                            )
                          : const SizedBox(),
                    ]
                  ),
                );
              })
            )
      ]),
    );
  }
}
