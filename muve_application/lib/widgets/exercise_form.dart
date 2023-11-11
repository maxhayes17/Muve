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
    Exercise? exercise = composeVM.newRoutine.exercises?[widget.index];

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.blueGrey[300]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Name',),
              onChanged: (value) {
                composeVM.updateExerciseName(exercise, value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                  shrinkWrap: true,
                  itemCount: exercise?.sets?.length,
                  itemBuilder: (context, index) {
                    ExerciseSet? set = exercise?.sets?[index];
                    return Padding(
                      padding: EdgeInsets.only(top:10, bottom: 10), 
                      child: Row(
                        children: [
                          Text('${index + 1}', 
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                          ),
                          SizedBox(width: 25,),
                          Container(
                            width: 70,
                            child:TextFormField(
                              decoration: const InputDecoration(
                                  hintText: '0',
                                  labelText: 'Weight',),
                                onChanged: (value) {
                                  composeVM.updateSetWeight(set, value);
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            ),
                          ),
                          SizedBox(width: 25,),
                          Container(
                            width: 70,
                            child:TextFormField(
                              decoration: const InputDecoration(
                                  hintText: '0',
                                  labelText: 'Reps',),
                                onChanged: (value) {
                                  composeVM.updateSetReps(set, value);
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly], 
                            ),
                          ),
                          SizedBox(width: 25,),
                          Container(
                            width: 70,
                            child:TextFormField(
                              decoration: const InputDecoration(
                                  hintText: '00:00',
                                  labelText: 'Duration',),
                                onChanged: (value){
                                  composeVM.updateSetDuration(set, value);
                                },
                            ),
                          ),
                        ],
                      ),
                    );  
              }),
            ElevatedButton(
              onPressed: () { 
                composeVM.addExerciseSet(exercise);
              },
              child: const Text("Add Set")
            ),
        ]),
      )
    );
  }
}