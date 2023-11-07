import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/models/exercise_model.dart';


class ExerciseCard extends StatelessWidget {
  final Exercise? exercise;

  const ExerciseCard({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.blueGrey
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(exercise!.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // Disable ListView scrolling
            itemCount: exercise!.sets.length,
            itemBuilder: (context, index) {
              final set = exercise!.sets[index];
              return Row(
                children: [
                  Text('${(index + 1)}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(width: 25,),
                  set.weight != null ? Text('${set.weight} lbs', style: TextStyle(fontSize: 16),) 
                    : SizedBox(width: 0,),
                  SizedBox(width: 25,),
                  set.repetitions != null ? Text('${set.repetitions} reps', style: TextStyle(fontSize: 16),)  
                    : SizedBox(width: 0,),
                  SizedBox(width: 25,),
                  set.duration != null ? Text('${set.duration}', style: TextStyle(fontSize: 16),) 
                  : SizedBox(width: 0,),
                ],
              );
            }
          )
        ]
      ),

    );
  }
}
