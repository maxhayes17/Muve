import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:muve_application/models/routine_model.dart";

// FAKE DATA
import "package:muve_application/data.dart";

class RoutineViewModel with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  //search Firebase by tags
  final List<Routine> _routineSearchResults = [];
  List<Routine> get routineSearchResults => _routineSearchResults;

  void searchRoutineTags(String tag) async {
    _routineSearchResults.clear();
    db
        .collection("routines")
        .where("tags", arrayContains: tag.toLowerCase())
        .withConverter(
          fromFirestore: Routine.fromFirestore,
          toFirestore: (Routine routine, _) => routine.toFirestore(),
        )
        .get()
        .then((querySnapShot) {
      for (var docSnapShot in querySnapShot.docs) {
        _routineSearchResults.add(docSnapShot.data());
        // print(docSnapShot.data().name);
        // print(_routineSearchResults.length);
      }
    }).then((value) => notifyListeners());
  }

  //Firebase test of getting a routine not used
  late Routine? _currentRoutine = Routine(
      id: 0,
      name: "name",
      duration: "duration",
      author: "author",
      tags: [],
      tracks: [],
      exercises: []);
  Routine? get currentRoutine => _currentRoutine;

  void setRoutineById(int id) async {
    String docName = id.toString();

    final docRef = db.collection("routines").doc(docName).withConverter(
          fromFirestore: Routine.fromFirestore,
          toFirestore: (Routine routine, _) => routine.toFirestore(),
        );
    final docSnap = await docRef.get();
    final routine = docSnap.data();
    if (routine != null) {
      _currentRoutine = routine;
      notifyListeners();
    }
  } //end Firebase get routine test

  Routine? getRoutineById(int id) {
    for (var routine in routines) {
      if (routine.id == id) {
        return routine;
      }
    }
    return null;
  }

  // String get name => this.name;
  // String get duration => this.duration;
  // User get author => this.author;
  // List<String> get tags => this.tags;
  // List<Track> get tracks => this.tracks;
  // List<Exercise> get exercises => this.exercises;
  // String get picture_path => this.picture_path;
}
