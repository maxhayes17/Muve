class Track {
  int? id;
  final String name;
  final String artist;
  String? duration;
  String? picturePath;

  Track(
      {this.id,
      required this.name,
      required this.artist,
      this.duration,
      this.picturePath});

  //used for searching tracks in compose_view_model
  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
        name: json['name'],
        artist: json['artist']['name'],
        picturePath: json['album']?['image']?.elementAt(2)['#text']);
  }
}
