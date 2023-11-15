import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/models/exercise_model.dart';
import 'package:muve_application/models/set_model.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/viewmodels/compose_view_model.dart';
import 'package:muve_application/widgets/exercise_form.dart';
import 'package:provider/provider.dart';

class ExerciseForm extends StatefulWidget {
  final int index;

  const ExerciseForm({super.key, required this.index});

  @override
  State<ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  @override
  Widget build(BuildContext context) {
    final composeVM = context.watch<ComposeViewModel>();
    Exercise? exercise = composeVM.newRoutine?.exercises?[widget.index];

    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.blueGrey[900]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Name',
              labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onChanged: (value) {
              composeVM.updateExerciseName(exercise, value);
            },
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: exercise?.sets?.length,
            itemBuilder: (context, index) {
              ExerciseSet? set = exercise?.sets?[index];
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Text('${index + 1}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: 70,
                      child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: '0',
                            hintStyle: const TextStyle(color: Colors.white70),
                            labelText: 'Weight',
                            labelStyle: const TextStyle(color: Colors.white70),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty){
                              composeVM.updateSetWeight(set, value);
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white)),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: 70,
                      child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: '0',
                            hintStyle: const TextStyle(color: Colors.white70),
                            labelText: 'Reps',
                            labelStyle: const TextStyle(color: Colors.white70),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty){
                              composeVM.updateSetReps(set, value);
                            }                          
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white)),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: 70,
                      child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: '00:00',
                            hintStyle: const TextStyle(color: Colors.white70),
                            labelText: 'Duration',
                            labelStyle: const TextStyle(color: Colors.white70),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty){
                              composeVM.updateSetDuration(set, value);
                            }
                          },
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              );
            }),
        const SizedBox(
          width: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButton(
                style: FilledButton.styleFrom(backgroundColor: Colors.blueGrey[700]),
                onPressed: () {
                  composeVM.addExerciseSet(exercise);
                },
                child: const Text("Add Set")),
            const Icon(
              Icons.delete_sweep_outlined,
              color: Colors.red,
            )
          ],
        ),
      ]),
    ));
  }
}
