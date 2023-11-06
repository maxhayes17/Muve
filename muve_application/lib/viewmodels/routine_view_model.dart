import "package:flutter/material.dart";
import "package:muve_application/models/routine_model.dart";

class RoutineViewModel with ChangeNotifier {
  final Map<int, List<Routine>> _routineList = _routineDatabase;

  Routine getRoutineById(int id) {
    for (var routines in _routineList.values) {
      for (var routine in routines) {
        if (routine.id == id) {
          return routine;
        }
      }
    }
    return defaultRoutine;
  }

  // String get name => this.name;
  // String get duration => this.duration;
  // User get author => this.author;
  // List<String> get tags => this.tags;
  // List<Track> get tracks => this.tracks;
  // List<Exercise> get exercises => this.exercises;
  // String get picture_path => this.picture_path;
}

final Routine defaultRoutine =
    Routine(id: 0, name: "default_routine", duration: "0.0 min", author: "God");

final Map<int, List<Routine>> _routineDatabase = {
  1: jeremyRoutineList,
  2: maxRoutineList,
  3: ethanRoutineList,
};

final List<Routine> jeremyRoutineList = [
  Routine(id: 1, name: "j_routine1", duration: "30 min", author: "jeremy"),
  Routine(id: 2, name: "j_routine2", duration: "1 hour", author: "jeremy"),
  Routine(id: 3, name: "j_routine3", duration: "45 min", author: "jeremy"),
  Routine(id: 4, name: "j_routine4", duration: "1 hour", author: "jeremy"),
  Routine(id: 5, name: "j_routine5", duration: "1.5 hour", author: "jeremy"),
  Routine(id: 6, name: "j_routine6", duration: "20 min", author: "jeremy"),
  Routine(id: 7, name: "j_routine7", duration: "15 hour", author: "jeremy"),
  Routine(id: 8, name: "j_routine8", duration: "1 hour", author: "jeremy"),
  Routine(id: 9, name: "j_routine9", duration: "25 min", author: "jeremy"),
];

final List<Routine> maxRoutineList = [
  Routine(id: 10, name: "m_routine1", duration: "30 min", author: "max"),
  Routine(id: 11, name: "m_routine2", duration: "1 hour", author: "max"),
  Routine(id: 12, name: "m_routine3", duration: "45 min", author: "max"),
  Routine(id: 13, name: "m_routine4", duration: "1 hour", author: "max"),
  Routine(id: 14, name: "m_routine5", duration: "1.5 hour", author: "max"),
  Routine(id: 15, name: "m_routine6", duration: "20 min", author: "max"),
  Routine(id: 16, name: "m_routine7", duration: "15 hour", author: "max"),
  Routine(id: 17, name: "m_routine8", duration: "1 hour", author: "max"),
  Routine(id: 18, name: "m_routine9", duration: "25 min", author: "max"),
];

final List<Routine> ethanRoutineList = [
  Routine(id: 19, name: "e_routine1", duration: "1 hour", author: "ethan"),
  Routine(id: 20, name: "e_routine2", duration: "1.5 hour", author: "ethan"),
  Routine(id: 21, name: "e_routine3", duration: "20 min", author: "ethan"),
  Routine(id: 22, name: "e_routine4", duration: "15 hour", author: "ethan"),
  Routine(id: 23, name: "e_routine5", duration: "1 hour", author: "ethan"),
  Routine(id: 24, name: "e_routine6", duration: "25 min", author: "ethan"),
];
