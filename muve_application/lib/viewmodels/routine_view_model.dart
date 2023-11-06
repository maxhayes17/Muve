import "package:flutter/material.dart";
import "package:muve_application/models/routine_model.dart";

class RoutineViewModel with ChangeNotifier {
  final Map<int, List<Routine>> _routineList = _routineDatabase;

  List<Routine>? routinesById(int? id) => _routineList[id];

  // String get name => this.name;
  // String get duration => this.duration;
  // User get author => this.author;
  // List<String> get tags => this.tags;
  // List<Track> get tracks => this.tracks;
  // List<Exercise> get exercises => this.exercises;
  // String get picture_path => this.picture_path;
}

final Map<int, List<Routine>> _routineDatabase = {
  1: jeremyRoutineList,
  2: maxRoutineList,
  3: ethanRoutineList,
};

final List<Routine> jeremyRoutineList = [
  Routine(id: 1, name: "routine1", duration: "30 min", author: "jeremy"),
  Routine(id: 2, name: "routine2", duration: "1 hour", author: "jeremy"),
  Routine(id: 3, name: "routine3", duration: "45 min", author: "jeremy"),
  Routine(id: 4, name: "routine4", duration: "1 hour", author: "max"),
  Routine(id: 5, name: "routine5", duration: "1.5 hour", author: "max"),
  Routine(id: 6, name: "routine6", duration: "20 min", author: "max"),
  Routine(id: 7, name: "routine7", duration: "15 hour", author: "ethan"),
  Routine(id: 8, name: "routine8", duration: "1 hour", author: "ethan"),
  Routine(id: 9, name: "routine9", duration: "25 min", author: "ethan"),
];

final List<Routine> maxRoutineList = [
  Routine(id: 1, name: "routine1", duration: "30 min", author: "jeremy"),
  Routine(id: 2, name: "routine2", duration: "1 hour", author: "jeremy"),
  Routine(id: 3, name: "routine3", duration: "45 min", author: "jeremy"),
  Routine(id: 4, name: "routine4", duration: "1 hour", author: "max"),
  Routine(id: 5, name: "routine5", duration: "1.5 hour", author: "max"),
  Routine(id: 6, name: "routine6", duration: "20 min", author: "max"),
  Routine(id: 7, name: "routine7", duration: "15 hour", author: "ethan"),
  Routine(id: 8, name: "routine8", duration: "1 hour", author: "ethan"),
  Routine(id: 9, name: "routine9", duration: "25 min", author: "ethan"),
];

final List<Routine> ethanRoutineList = [
  Routine(id: 4, name: "routine4", duration: "1 hour", author: "max"),
  Routine(id: 5, name: "routine5", duration: "1.5 hour", author: "max"),
  Routine(id: 6, name: "routine6", duration: "20 min", author: "max"),
  Routine(id: 7, name: "routine7", duration: "15 hour", author: "ethan"),
  Routine(id: 8, name: "routine8", duration: "1 hour", author: "ethan"),
  Routine(id: 9, name: "routine9", duration: "25 min", author: "ethan"),
];
