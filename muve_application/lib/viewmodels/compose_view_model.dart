import 'package:flutter/material.dart';
import 'package:muve_application/models/exercise_model.dart';
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/models/set_model.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';

class ComposeViewModel with ChangeNotifier {
  final _routineList = routineDatabase;
  Routine? _newRoutine;
  List<Exercise>? _newExerciseList;
  List<ExerciseSet>? _newSetList;

  Routine? newRoutine() {
    int nextRoutineId = numOfRoutines();

    _newSetList = [ExerciseSet(id: 1, weight: 0, repetitions: 0, duration: "")];
    _newExerciseList = [Exercise(id: 0, name: "exercise", sets: _newSetList)];
    _newRoutine = Routine(
        id: nextRoutineId,
        name: "name",
        duration: "duration",
        author: "author",
        exercises: _newExerciseList);

    return _newRoutine;
  }

  void saveRoutine(int userID) {
    var userRoutineList = _routineList[userID];
    userRoutineList?.add(_newRoutine!);
  }

  int numOfRoutines() {
    int total = 0;
    for (var routines in _routineList.values) {
      total += routines.length;
    }
    return total;
  }
}
