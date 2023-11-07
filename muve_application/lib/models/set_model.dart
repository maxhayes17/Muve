class ExerciseSet{

  final int id;
  final int? weight;
  final int? repetitions;
  final String? duration;


  ExerciseSet({
    required this.id,
    this.weight,
    this.repetitions,
    this.duration
  });

  factory ExerciseSet.fromJson(Map<String, dynamic> json){
    return ExerciseSet(
      id: json['id'],
      weight: json['weight'],
      repetitions: json['repetitions'],
      duration: json['duration'],
    );
  }

}