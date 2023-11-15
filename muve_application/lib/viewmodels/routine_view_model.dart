import "package:flutter/material.dart";
import "package:muve_application/models/exercise_model.dart";
import "package:muve_application/models/routine_model.dart";
import "package:muve_application/models/set_model.dart";
import "package:muve_application/models/track_model.dart";

// FAKE DATA
import "package:muve_application/data.dart";

class RoutineViewModel with ChangeNotifier {

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