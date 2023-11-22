import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:muve_application/models/routine_model.dart";

// FAKE DATA
import "package:muve_application/data.dart";

class RoutineViewModel with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  //current routine for displaying/sharing
  late Routine? _currentRoutine = Routine(
      id: 0,
      name: "name",
      duration: "duration",
      author: "author",
      tags: [],
      tracks: [],
      exercises: []);
  Routine? get currentRoutine => _currentRoutine;

  //set current routine via a Firebase query
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
  }

  //variable to hold results of Firabase query
  final List<Routine> _routineSearchResults = [];
  List<Routine> get routineSearchResults => _routineSearchResults;

  //query Firebase by tags
  void searchRoutineTags(String tag) async {
    _routineSearchResults.clear();
    db
        .collection("routines")
        .where("tags", arrayContains: tag)
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

  //query Firebase by routine name
  void searchRoutineByName(String name) async {
    _routineSearchResults.clear();
    db
        .collection("routines")
        .where("name", isEqualTo: name)
        .withConverter(
          fromFirestore: Routine.fromFirestore,
          toFirestore: (Routine routine, _) => routine.toFirestore(),
        )
        .get()
        .then((querySnapShot) {
      for (var docSnapShot in querySnapShot.docs) {
        _routineSearchResults.add(docSnapShot.data());
      }
    }).then((value) => notifyListeners());
  }

  //query Firebase by name OR tags
  //todo

  //legacy funciton to search local copy of routine database (not used?)
  Routine? getRoutineById(int id) {
    for (var routine in routines) {
      if (routine.id == id) {
        return routine;
      }
    }
    return null;
  }
}
