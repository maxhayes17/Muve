class Track {
  final String id;
  final String name;
  final String artist;
  final String duration;
  final String picturePath;

  Track(
      {required this.id,
      required this.name,
      required this.artist,
      required this.duration,
      required this.picturePath});

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
        id: json['id'],
        name: json['name'],
        artist: json['artist'],
        duration: json['duration'],
        picturePath: json['picture_path']);
  }
}
