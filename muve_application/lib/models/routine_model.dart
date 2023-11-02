import 'user_model.dart';
import 'exercise_model.dart';
import 'track_model.dart';

class Routine{

  final String id;
  final String name;
  final String duration;
  final User author;
  final List<String> tags;
  final List<Track> tracks;
  final List<Exercise> exercises;

  Routine({
    required this.id,
    required this.name,
    required this.duration,
    required this.author,
    required this.tags,
    required this.tracks,
    required this.exercises
  });

  factory Routine.fromJson(Map<String, dynamic> json){

    return Routine(
      id: json['id'],
      name: json['name'],
      duration: json['duration'],
      author: json['author'],
      tags: List<String>.from(json['tags']),
      tracks: List<Track>.from(json['tracks']),
      exercises: List<Exercise>.from(json['exercises'])
    );
  }

}