import 'package:flutter/material.dart';
import 'package:muve_application/models/exercise_model.dart';
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/models/set_model.dart';
import 'package:muve_application/models/track_model.dart';
import 'package:muve_application/models/user_model.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:muve_application/viewmodels/user_view_model.dart';

class ComposeViewModel with ChangeNotifier {
  final _routineList = routineDatabase;


  final List<Track> _tracks = [
    Track(id: 1, name: 'name1', artist: 'artist', duration: 'duration', picturePath: 'picturePath'),
    Track(id: 2, name: 'name2', artist: 'artist', duration: 'duration', picturePath: 'picturePath'),
    Track(id: 3, name: 'name3', artist: 'artist', duration: 'duration', picturePath: 'picturePath'),
    Track(id: 4, name: 'name4', artist: 'artist', duration: 'duration', picturePath: 'picturePath'),
    Track(id: 5, name: 'name5', artist: 'artist', duration: 'duration', picturePath: 'picturePath'),
    Track(id: 6, name: 'name6', artist: 'artist', duration: 'duration', picturePath: 'picturePath')
  ];

  Routine? _newRoutine;
  List<Track> _trackSearchResults = [];

  List<Track>? get trackSearchResults => _trackSearchResults;
  Routine? get newRoutine => _newRoutine;

  void createRoutine(User? user){
    _newRoutine = Routine(        
        id: numOfRoutines() + 1,
        name: '',
        duration: '00:00',
        author: user!.username,
        exercises: [Exercise(id: 1, sets: [ExerciseSet(id: 1)])],
        tracks: [],
    );
    // notifyListeners();
  }

  // Updating routine...
  void updateRoutineName(String value){
    _newRoutine?.name = value;
    notifyListeners();
  }
  void addExercise(){
    _newRoutine?.exercises?.add(Exercise(id: _newRoutine!.exercises!.length + 1, sets: [ExerciseSet(id: 1)]));
    notifyListeners();
  }

  void addTrack(Track? track){
    _newRoutine?.tracks?.add(track!);
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

  void saveRoutine(User? user) {
    var userRoutineList = _routineList[user!.id];
    userRoutineList?.add(_newRoutine!);
    // Reset _newRoutine
    createRoutine(user);
  }

  int numOfRoutines() {
    int total = 0;
    for (var routines in _routineList.values) {
      total += routines.length;
    }
    return total;
  }

  void searchTracks(String value){
    List<Track> results = [];
    for (var track in _tracks){
      if (track.name.contains(value)){
        results.add(track);
      }
    }
    _trackSearchResults = results;
    notifyListeners();
  }



}


