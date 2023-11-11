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
      this.tracks,
      this.exercises,
      this.picturePath});

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
