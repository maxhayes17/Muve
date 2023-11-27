import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:muve_application/models/routine_model.dart";

class ExploreViewModel with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  final List<Routine> _routineSearchResults = [];
  List<Routine> get routineSearchResults => _routineSearchResults;

  void clearSearchResults(){
    _routineSearchResults.clear();
    notifyListeners();
  }

    //query Firebase by routine name case-sensitive
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

  void searchRoutineTags(String tag) async {
    // _routineSearchResults.clear();
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
        // Add unique routines only
        if(!_routineSearchResults.any((routine) => routine.id == docSnapShot.data().id)){
          _routineSearchResults.add(docSnapShot.data());
        }
        // print(docSnapShot.data().name);
        // print(_routineSearchResults.length);
      }
    }).then((value) => notifyListeners());
  }
}