import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:muve_application/models/routine_model.dart";
import "package:muve_application/models/user_model.dart";

// FAKE DATA
import "package:muve_application/data.dart";

class UserViewModel with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  User? _user;
  final List<Routine> _recommendedRoutines = [];
  List<Routine> _recentRoutines = [];

  // Get current user
  User? get user => _user;
  String? get username => _user?.username;
  int? get id => _user?.id;

  // Get user's routines
  List<Routine>? get routines => _user?.routines;
  // Get user's recommended routines
  List<Routine> get recommendedRoutines => _recommendedRoutines;
  // Get user's recent routines
  List<Routine> get recentRoutines => _recentRoutines;

  // Settings
  void updateUsername(String value){
    
  }


  // Auth
  void logout(){
    _user = null;
  }

  bool authenticateUser(String email, String password) {
    for (var user in users) {
      if (user.email == email && user.password == password) {
        _user = user;
        loadUserRoutines();
        updateRoutineCount();
        notifyListeners();
        return true;
      }
    }
    return false;
  }


  // User routines
  bool routineInLibrary(int id) {
    if (_user?.routines != null &&
        _user!.routines!.any((routine) => routine.id == id)) {
      return true;
    }
    return false;
  }

  //add to the end of the list i.e. most recent
  void addRoutineToLibrary(Routine routine) {
    _user!.routines!.add(routine);
    notifyListeners();
  }

  void removeRoutineFromLibrary(Routine routine){
    _user!.routines!.removeWhere((element) => element.id == routine.id);
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
    }).then((value){
      // After routines have been loaded in, can get recent and recommended routines
      getRecentRoutines();
      getRecommendRoutines();
      notifyListeners();
    });
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
  void getRecentRoutines() {
    if (_user!.routines!.length >= 3) {
      _recentRoutines = _user!.routines!.sublist(_user!.routines!.length - 3, _user!.routines!.length);
    } else {
      _recentRoutines = user!.routines!;
    }
  }

  //query Firebase for routines NOT by the current user. Keep first 5.
  void getRecommendRoutines() async {
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