import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/services.dart";
import "package:muve_application/models/routine_model.dart";
import "package:url_launcher/url_launcher.dart";

class RoutineViewModel with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  //variable to hold results of Firabase query
  final List<Routine> _routineSearchResults = [];

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

  List<Routine> get routineSearchResults => _routineSearchResults;

  //set current routine via a Firebase query of routine id
  void setRoutineById(int id) async {
    db
        .collection("routines")
        .where("id", isEqualTo: id)
        .withConverter(
          fromFirestore: Routine.fromFirestore,
          toFirestore: (Routine routine, _) => routine.toFirestore(),
        )
        .get()
        .then((querySnapShot) {
      for (var docSnapShot in querySnapShot.docs) {
        _currentRoutine = docSnapShot.data();
      }
    }).then((value) => notifyListeners());
  }

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
  // Routine? getRoutineById(int id) {
  //   for (var routine in routines) {
  //     if (routine.id == id) {
  //       return routine;
  //     }
  //   }
  //   return null;
  // }

  void sendSMS() async {
    String routineString =
        "www.muve.com/users/${_currentRoutine!.author}/${_currentRoutine!.name}";
    String body = "Check out my routine on Muve!\n$routineString";

    var url = Uri.parse("sms:&body=$body");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // throw "could not launch $url";
    }
  }

  void saveToClipboard() async {
    String routineString =
        "www.muve.com/users/${_currentRoutine!.author}/${_currentRoutine!.name}";
    String body = "Check out my routine on Muve!\n$routineString";
    await Clipboard.setData(ClipboardData(text: body));
  }
}
