import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:muve_application/models/routine_model.dart";

// FAKE DATA
import "package:muve_application/data.dart";

class RoutineViewModel with ChangeNotifier {
  //Firebase test
  final db = FirebaseFirestore.instance;
  late Routine? _currentRoutine;

  Routine? get currentRoutine => _currentRoutine;

  Future<void> setRoutineById(int id) async {
    String docName = id.toString();

    final docRef = db.collection("routines").doc(docName).withConverter(
          fromFirestore: Routine.fromFirestore,
          toFirestore: (Routine routine, _) => routine.toFirestore(),
        );
    final docSnap = await docRef.get();
    final routine = docSnap.data();
    if (routine != null) {
      _currentRoutine = routine;
    } else {
      _currentRoutine = null;
    }
    notifyListeners();
  }
  //

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
