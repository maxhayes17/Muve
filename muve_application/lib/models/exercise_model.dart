import "package:muve_application/models/set_model.dart";

class Exercise {
  final int id;
  String? name;
  final String? notes;
  List<ExerciseSet> sets;

  Exercise({required this.id, this.name, this.notes, required this.sets});
}
