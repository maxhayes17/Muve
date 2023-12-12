import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:muve_application/models/exercise_model.dart';
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/models/set_model.dart';
import 'package:muve_application/models/track_model.dart';
import 'package:muve_application/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ComposeViewModel with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  Routine? _newRoutine;
  Routine? get newRoutine => _newRoutine;

  final List<Track> _trackSearchResults = [];
  List<Track>? get trackSearchResults => _trackSearchResults;

  int routineCount = -1;

  void updateRoutineCount() async {
    final docRef = await db.collection("routines").get();
    routineCount = docRef.size;
  }

  void createRoutine(User? user) {
    _newRoutine = Routine(
      id: routineCount + 1,
      name: '',
      author: user?.username ?? "",
      tags: [],
      exercises: [
        Exercise(id: 1, sets: [ExerciseSet(id: 1)])
      ],
      tracks: [],
    );
    // notifyListeners();
  }

  // Updating routine...
  void updateRoutineName(String value) {
    _newRoutine?.name = value;
    notifyListeners();
  }

  void addTag(String value) {
    _newRoutine?.tags.add(value);
  }

  void addExercise() {
    _newRoutine?.exercises.add(Exercise(
        id: _newRoutine!.exercises.length + 1, sets: [ExerciseSet(id: 1)]));
    notifyListeners();
  }

  void removeExercise(Exercise? exercise) {
    _newRoutine?.exercises.remove(exercise);
    notifyListeners();
  }

  void addTrack(Track? track) {
    _newRoutine?.tracks.add(track!);
    notifyListeners();
  }

  void removeTrack(Track? track) {
    _newRoutine?.tracks.remove(track);
    notifyListeners();
  }

  // Updating exercise...
  void addExerciseSet(Exercise? exercise) {
    exercise?.sets.add(ExerciseSet(id: exercise.sets.length + 1));
    notifyListeners();
  }

  void updateExerciseName(Exercise? exercise, String value) {
    exercise?.name = value;
    notifyListeners();
  }

  // Update exerciseSet...
  void updateSetWeight(ExerciseSet? set, String value) {
    set?.weight = int.parse(value);
    notifyListeners();
  }

  void updateSetReps(ExerciseSet? set, String value) {
    set?.repetitions = int.parse(value);
    notifyListeners();
  }

  void updateSetDuration(ExerciseSet? set, value) {
    set?.duration = value;
    notifyListeners();
  }

  void saveRoutine(User? user) async {
    //add to local routine list
    user?.routines?.add(_newRoutine!);

    //add to Firestore db
    final docRef = db
        .collection("routines")
        .withConverter(
          fromFirestore: Routine.fromFirestore,
          toFirestore: (Routine routine, options) => routine.toFirestore(),
        )
        .doc();
    await docRef.set(_newRoutine!);

    // Reset _newRoutine
    routineCount++;
    createRoutine(user);
  }

  // int numOfRoutines() {
  //   return routines.length;
  // }

  void clearSearchResults() {
    _trackSearchResults.clear();
    notifyListeners();
  }

  // Search for music using last.fm API
  Future<void> searchTracks(String value) async {
    // Clear previous search results
    _trackSearchResults.clear();

    // API params
    const apiKey = 'd49f225e7ef13866f25b182c31d02bca';
    const baseUrl = 'http://ws.audioscrobbler.com/2.0/';

    try{
      // Make API request, handle if successful, else print error code
      final response = await http.get(Uri.parse(
          '$baseUrl?method=track.search&track=$value&api_key=$apiKey&format=json'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final results = data['results']['trackmatches']['track'];

        // Only look at top 10 results
        var count = 0;
        for (var result in results) {
          var artist = result['artist'];
          var name = result['name'];

          //Re-query to get track album art
          final response = await http.get(Uri.parse(
              '$baseUrl?method=track.getInfo&api_key=$apiKey&artist=$artist&track=$name&format=json'));
          if (response.statusCode == 200) {
            final Map<String, dynamic> data = await json.decode(response.body);  

            final trackData = data['track'];
            // Create track object, add to list of results to be displayed
            if (trackData != null) {
              var track = Track.fromJson(trackData);
              _trackSearchResults.add(track);
            }
            notifyListeners();
          } else {
            print('Error: ${response.statusCode}');
          }
          count++;
          if (count == 10) break;
        }
        notifyListeners();
        // print(results);
      } else {
        // Handle the error
        print('Error: ${response.statusCode}');
      }
    } catch(e){
      print(e);
    }
  }
}
