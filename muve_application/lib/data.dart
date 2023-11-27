import 'package:muve_application/models/exercise_model.dart';
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/models/set_model.dart';
import 'package:muve_application/models/track_model.dart';
import 'package:muve_application/models/user_model.dart';

// FAKE DATA for testing

final List<ExerciseSet> sets = [
  ExerciseSet(id: 1, weight: 70, repetitions: 8),
  ExerciseSet(id: 2, weight: 100, repetitions: 6),
  ExerciseSet(id: 3, weight: 100, repetitions: 12),
  ExerciseSet(id: 4, weight: 120, repetitions: 5),
  ExerciseSet(id: 5, weight: 140, repetitions: 3),
];

final List<Exercise> exercises = [
  Exercise(id: 1, name: 'Bench press', sets: sets.sublist(0, 2)),
  Exercise(id: 2, name: 'Squat', sets: sets.sublist(2, 5)),
  Exercise(id: 3, name: 'Weighted walk', sets: [ExerciseSet(id: 6, weight: 20, duration: '10:00')]),
  Exercise(id: 4, name: 'Run', sets: [ExerciseSet(id: 7, duration: '15:00')]),
];

final List<String> tags = ['bench press','squat','weighted walk','run'];

final List<Track> tracks = [
  Track(id: 1,name: 'Song 1',artist: 'artist',duration: '3:00',picturePath: ''),
  Track(id: 2,name: 'Song 2',artist: 'artist',duration: '3:00',picturePath: ''),
  Track(id: 3,name: 'Song 3',artist: 'artist',duration: '3:00',picturePath: ''),
  Track(id: 4,name: 'Song 4',artist: 'artist',duration: '3:00',picturePath: ''),
  Track(id: 5,name: 'Song 5',artist: 'artist',duration: '3:00',picturePath: ''),
  Track(id: 6,name: 'Song 6',artist: 'artist',duration: '3:00',picturePath: ''),
];

int totalRoutines = routines.length;

final List<Routine> routines = [
  Routine(id: 1,name: 'Routine 1',duration: '45:00',author: 'jeremy',tags:tags, exercises: exercises,tracks: tracks),
  Routine(id: 2,name: 'Routine 2',duration: '30:00',author: 'jeremy',tags: tags.sublist(0,3), exercises: exercises.sublist(0, 3),tracks: tracks.sublist(0, 4)),
  Routine(id: 3,name: 'Routine 3',duration: '25:00',author: 'jeremy',tags:tags.sublist(2,4),  exercises: exercises.sublist(2, 4),tracks: tracks.sublist(0, 3)),
  Routine(id: 4,name: 'Routine 1',duration: '45:00',author: 'max',tags:tags,exercises: exercises,tracks: tracks),
  Routine(id: 5,name: 'Routine 2',duration: '30:00',author: 'max',tags: tags.sublist(0,3),exercises: exercises.sublist(0, 3),tracks: tracks.sublist(0, 4)),
  Routine(id: 6,name: 'Routine 3',duration: '25:00',author: 'max',tags:tags.sublist(2,4),exercises: exercises.sublist(2, 4),tracks: tracks.sublist(0, 3)),
  Routine(id: 7,name: 'Routine 1',duration: '45:00',author: 'ethan',tags:tags,exercises: exercises,tracks: tracks),
  Routine(id: 8,name: 'Routine 2',duration: '30:00',author: 'ethan',tags: tags.sublist(0,3),exercises: exercises.sublist(0, 3),tracks: tracks.sublist(0, 4)),
  Routine(id: 9,name: 'Routine 3',duration: '25:00',author: 'ethan',tags:tags.sublist(2,4),exercises: exercises.sublist(2, 4),tracks: tracks.sublist(0, 3)),
  Routine(id: 10,name: 'Routine 1',duration: '45:00',author: 'Muve',tags:tags,exercises: exercises,tracks: tracks),
  Routine(id: 11,name: 'Routine 2',duration: '30:00',author: 'Muve',tags: tags.sublist(0,3),exercises: exercises.sublist(0, 3),tracks: tracks.sublist(0, 4)),
  Routine(id: 12,name: 'Routine 3',duration: '25:00',author: 'Muve',tags:tags.sublist(2,4),exercises: exercises.sublist(2, 4),tracks: tracks.sublist(0, 3)),
];

final List<User> users = [
  User(id: 1,email: 'jeremy@muve.com',username: 'jeremy',password: 'pw',routines: []),
  User(id: 2,email: 'max@muve.com',username: 'max',password: 'pw',routines: []),
  User(id: 3,email: 'ethan@muve.com',username: 'ethan',password: 'pw',routines:[] ),
  User(id: 4,email: 'user@test.com',username: 'user',password: 'test',routines:[] ),
];

// routines.sublist(0,3)
// routines.sublist(3,6)
// routines.sublist(6,9)
// routines.sublist(9,12)
