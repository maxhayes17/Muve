import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:muve_application/models/routine_model.dart";
import "package:muve_application/models/user_model.dart";

// FAKE DATA
import "package:muve_application/data.dart";

class UserViewModel with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  User? _user;
  User? get user => _user;
  String? get username => _user?.username;
  int? get id => _user?.id;
  List<Routine>? get routines => _user?.routines;

  final List<Routine> _recommendedRoutines = [];
  List<Routine> get recommendedRoutines => _recommendedRoutines;

  bool authenticateUser(String email, String password) {
    for (var user in users) {
      if (user.email == email && user.password == password) {
        _user = user;
        loadUserRoutines();
        updateRoutineCount();
        recommendRoutines();
        notifyListeners();
        return true;
      }
    }
    return false;
  }

  bool routineInLibrary(int id) {
    if (_user?.routines != null &&
        _user!.routines!.any((routine) => routine.id == id)) {
      return true;
    }
    return false;
  }

  //add to the front of the list i.e. most recent
  //update recommened routines list
  void addRoutineToLibrary(Routine routine) {
    // _user!.routines!.add(routine);
    _user!.routines!.insert(0, routine);
    recommendRoutines();
    notifyListeners();
  }

  //load user routines from Firebase after authentication
  void loadUserRoutines() async {
    user?.routines?.clear();
    db
        .collection("routines")
        .where("author", isEqualTo: _user!.username)
        .withConverter(
          fromFirestore: Routine.fromFirestore,
          toFirestore: (Routine routine, _) => routine.toFirestore(),
        )
        .get()
        .then((querySnapshot) {
      for (var docSnapShot in querySnapshot.docs) {
        _user!.routines!.add(docSnapShot.data());
      }
    }).then((value) => notifyListeners());
  }

  void updateRoutineCount() async {
    final docRef = await db.collection("routines").get();
    totalRoutines = docRef.size;
  }

  // void loadAllRoutines() async {
  //   db
  //       .collection("routines")
  //       .withConverter(
  //           fromFirestore: Routine.fromFirestore,
  //           toFirestore: (Routine routine, _) => routine.toFirestore())
  //       .get()
  //       .then((querySnapshot) {
  //     for (var docSnapShot in querySnapshot.docs) {
  //       routines!.add(docSnapShot.data());
  //     }
  //   }).then((value) => notifyListeners());
  // }

  // Assuming last 3 added routines are most recent... return last 3 routines
  List<Routine> getRecentRoutines() {
    if (_user!.routines!.length >= 3) {
      return _user!.routines!.sublist(_user!.routines!.length - 3);
    } else {
      return _user!.routines!;
    }
  }

  //query Firebase for routines NOT by the current user. Keep first 5.
  void recommendRoutines() async {
    _recommendedRoutines.clear();
    db
        .collection("routines")
        .where("author", isNotEqualTo: _user!.username)
        .withConverter(
          fromFirestore: Routine.fromFirestore,
          toFirestore: (Routine routine, _) => routine.toFirestore(),
        )
        .get()
        .then((querySnapshot) {
      var count = 0;
      for (var docSnapShot in querySnapshot.docs) {
        //skip routine if already in the user's routines
        if (routineInLibrary(docSnapShot.data().id)) {
          continue;
        }
        _recommendedRoutines.add(docSnapShot.data());
        count++;
        //max five recommended routines
        if (count == 5) {
          break;
        }
      }
    }).then((value) => notifyListeners());
  }
}//end class