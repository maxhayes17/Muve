class Exercise{

  final String id;
  final String name;
  final String notes;
  final List<String> sets;

  Exercise({
    required this.id,
    required this.name,
    required this.notes,
    required this.sets
  });

  factory Exercise.fromJson(Map<String, dynamic> json){
    return Exercise(
      id: json['id'],
      name: json['name'],
      notes: json['notes'],
      sets: List<String>.from(json['sets'])
    );
  }

}