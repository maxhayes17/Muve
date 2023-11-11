import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/models/exercise_model.dart';
import 'package:muve_application/models/set_model.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/widgets/exercise_form_element.dart';
import 'package:provider/provider.dart';

class ExerciseFormElement extends StatefulWidget {
  final Exercise? exercise;

  const ExerciseFormElement({super.key, required this.exercise});

  @override
  State<ExerciseFormElement> createState() => _ExerciseFormElementState();
}

class _ExerciseFormElementState extends State<ExerciseFormElement> {
List<ExerciseSet> newSetList = [ExerciseSet(id: 1)];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.blueGrey[300]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Name',)
              ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: newSetList.length,
                  itemBuilder: (context, index) {
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
                                // border: UnderlineInputBorder(),
                                labelText: 'Weight',)
                            ),
                          ),
                          SizedBox(width: 25,),
                          Container(
                            width: 70,
                            child:TextFormField(
                              decoration: const InputDecoration(
                                hintText: '0',
                                // border: UnderlineInputBorder(),
                                labelText: 'Reps',)
                            ),
                          ),
                          SizedBox(width: 25,),
                          Container(
                            width: 70,
                            child:TextFormField(
                              decoration: const InputDecoration(
                                hintText: '00:00',
                                // border: UnderlineInputBorder(),
                                labelText: 'Duration',)
                            ),
                          ),
                        ],
                      ),
                    );  
              })
            ),
            ElevatedButton(
              onPressed: () { 
                setState((){
                  newSetList.add(ExerciseSet(id: 1)); 
                // newExerciseList.add("c");
              });
              },
              child: const Text("Add Set")
            ),
        ]),
      )
    );
  }
}