import "package:muve_application/models/exercise_model.dart";
import "package:muve_application/models/track_model.dart";
import "package:muve_application/models/user_model.dart";
import "package:muve_application/models/routine_model.dart";

class RoutineViewModel{

  final Routine routine;

  RoutineViewModel({required this.routine});

    String get name => this.name;
    String get duration => this.duration;
    User get author => this.author;
    List<String> get tags => this.tags;
    List<Track> get tracks => this.tracks;
    List<Exercise> get exercises => this.exercises;
    String get picture_path => this.picture_path;

}