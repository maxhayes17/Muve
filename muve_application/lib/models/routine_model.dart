import 'package:cloud_firestore/cloud_firestore.dart';

import 'exercise_model.dart';
import 'track_model.dart';

class Routine {
  final int id;
  String name;
  String duration;
  String author;
  final List<String>? tags;
  List<Track>? tracks;
  List<Exercise>? exercises;
  final String? picturePath;

  Routine(
      {required this.id,
      required this.name,
      required this.duration,
      required this.author,
      this.tags,
      required this.tracks,
      required this.exercises,
      this.picturePath});

  factory Routine.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Routine(
        id: data?['id'],
        name: data?['name'],
        duration: data?['duration'],
        author: data?['author'],
        // tags: data?['tags'],
        tracks: data?['tracks'] is Iterable ? List.from(data?['tracks']) : null,
        exercises: data?['exercises'] is Iterable
            ? List.from(data?['exercises'])
            : null,
        picturePath: data?['picturePath']);
  }

  Map<String, dynamic> toFirestore() {
    var exerciseList = List<Map<String, dynamic>>.empty(growable: true);
    for (var e in exercises!) {
      var exerciseMap = <String, dynamic>{};
      exerciseMap['id'] = e.id;
      exerciseMap['name'] = e.name;
      // exerciseMap['notes'] = e.notes;
      var setList = List<Map<String, dynamic>>.empty(growable: true);
      for (var s in e.sets) {
        var setMap = <String, dynamic>{};
        setMap['id'] = s.id;
        setMap['weight'] = s.weight;
        setMap['repetitions'] = s.repetitions;
        setMap['duration'] = s.duration;
        setList.add(setMap);
      }
      exerciseMap['sets'] = setList;
      exerciseList.add(exerciseMap);
    }

    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (duration != null) "duration": duration,
      if (author != null) "author": author,
      if (tags != null) "tags": tags,
      // if (tracks != null) "tracks": tracks,
      if (exercises != null) "exercises": exerciseList,
      if (picturePath != null) "picturePath": picturePath,
    };
  }

  factory Routine.fromJson(Map<String, dynamic> json) {
    return Routine(
        id: json['id'],
        name: json['name'],
        duration: json['duration'],
        author: json['author'],
        tags: List<String>.from(json['tags']),
        tracks: List<Track>.from(json['tracks']),
        exercises: List<Exercise>.from(json['exercises']),
        picturePath: json['picture_path']);
  }
}
