import 'package:flutter/material.dart';
import 'package:muve_application/models/exercise_model.dart';
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/models/set_model.dart';
import 'package:muve_application/models/track_model.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';

class ComposeViewModel with ChangeNotifier {
  final _routineList = routineDatabase;


  final List<Track> _tracks = [
    Track(id: 1, name: 'name', artist: 'artist', duration: 'duration', picturePath: 'picturePath'),
    Track(id: 2, name: 'name', artist: 'artist', duration: 'duration', picturePath: 'picturePath'),
    Track(id: 3, name: 'name', artist: 'artist', duration: 'duration', picturePath: 'picturePath'),
    Track(id: 4, name: 'name', artist: 'artist', duration: 'duration', picturePath: 'picturePath'),
    Track(id: 5, name: 'name', artist: 'artist', duration: 'duration', picturePath: 'picturePath'),
    Track(id: 6, name: 'name', artist: 'artist', duration: 'duration', picturePath: 'picturePath')
  ];
  //   // _newSetList = [ExerciseSet(id: 1, weight: 0, repetitions: 0, duration: "")];
  //   // _newExerciseList = [Exercise(id: 0, name: "exercise", sets: _newSetList)];
  //   _newRoutine = Routine(
  //       id: nextRoutineId,
  //       name: "",
  //       duration: "00:00",
  //       author: "author",
  //       exercises: [],
  //       tracks: []
  //     );

  //   return _newRoutine;
  // }
  Routine _newRoutine = Routine(
        id: 25,
        name: "foo",
        duration: "00:00",
        author: "author",
        exercises: [Exercise(id: 1, sets: [ExerciseSet(id: 1)])],
        tracks: [Track(id: 1, name: 'name', artist: 'artist', duration: 'duration', picturePath: 'picturePath'),]
    );

  Routine get newRoutine => _newRoutine;


  // Updating routine...
  void updateRoutineName(String value){
    _newRoutine.name = value;
    notifyListeners();
  }
  void addExercise(){
    _newRoutine.exercises?.add(Exercise(id: _newRoutine.exercises!.length + 1, sets: [ExerciseSet(id: 1)]));
    notifyListeners();
  }

  // Updating exercise...
  void addExerciseSet(Exercise? exercise){
    exercise?.sets?.add(ExerciseSet(id: exercise.sets!.length + 1));
    notifyListeners();
  }
  void updateExerciseName(Exercise? exercise, String value){
    exercise?.name = value;
    notifyListeners();
  }


  // Update exerciseSet...
  void updateSetWeight(ExerciseSet? set, String value){
    set?.weight = int.parse(value);
    notifyListeners();
  }
  void updateSetReps(ExerciseSet? set, String value){
    set?.repetitions = int.parse(value);
    notifyListeners();
  }
  void updateSetDuration(ExerciseSet? set, value){
    set?.duration = value;
    notifyListeners();
  }

  List<Track>? newTrackList(Routine routine){


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
