class Track {

  final String id;
  final String name;
  final String artist;
  final String duration;
  final String picture_path;

  Track({
    required this.id,
    required this.name,
    required this.artist,
    required this.duration,
    required this.picture_path
  });

  factory Track.fromJson(Map<String, dynamic> json){
    return Track(
      id: json['id'],
      name: json['name'],
      artist: json['artist'],
      duration: json['duration'],
      picture_path: json['picture_path']
    );
  }

}