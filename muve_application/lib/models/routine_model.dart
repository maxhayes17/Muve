import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:muve_application/models/set_model.dart';

import 'exercise_model.dart';
import 'track_model.dart';

class Routine implements Comparable<Routine> {
  final int id;
  String name;
  String author;
  final List<String> tags;
  List<Track> tracks;
  List<Exercise> exercises;
  final String? picturePath;

  Routine(
      {required this.id,
      required this.name,
      required this.author,
      required this.tags,
      required this.tracks,
      required this.exercises,
      this.picturePath});

  factory Routine.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    List<Exercise> exercises = [];
    final exerciseList = List.from(data?['exercises']);
    for (var e in exerciseList) {
      List<ExerciseSet> sets = [];
      for (var s in List.from(e['sets'])) {
        var inputSet = ExerciseSet(
          id: s['id'],
          weight: s['weight'],
          repetitions: s['repetitions'],
          duration: s['duration'],
        );
        sets.add(inputSet);
      }
      var inputExercise = Exercise(
        id: e['id'],
        name: e['name'],
        sets: sets,
      );
      exercises.add(inputExercise);
    }

    List<Track> tracks = [];
    final trackList = List.from(data?['tracks']);
    for (var t in trackList) {
      var inputTrack = Track(
        id: t['id'],
        name: t['name'],
        artist: t['artist'],
        duration: t['duration'],
        picturePath: t['picturePath'],
      );
      tracks.add(inputTrack);
    }

    return Routine(
        id: data?['id'],
        name: data?['name'],
        author: data?['author'],
        tags: List.from(data?['tags']),
        tracks: tracks,
        exercises: exercises,
        picturePath: data?['picturePath']);
  }

  Map<String, dynamic> toFirestore() {
    var exerciseList = List<Map<String, dynamic>>.empty(growable: true);
    for (var e in exercises) {
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

    var trackList = List<Map<String, dynamic>>.empty(growable: true);
    for (var t in tracks) {
      var trackMap = <String, dynamic>{};
      trackMap['id'] = t.id;
      trackMap['name'] = t.name;
      trackMap['artist'] = t.artist;
      trackMap['duration'] = t.duration;
      trackMap['picturePath'] = t.picturePath;
      trackList.add(trackMap);
    }

    return {
      "id": id,
      "name": name,
      "author": author,
      "tags": tags,
      "tracks": trackList,
      "exercises": exerciseList,
      if (picturePath != null) "picturePath": picturePath,
    };
  }

  @override
  int compareTo(Routine other) {
    return id.compareTo(other.id);
  }
}
