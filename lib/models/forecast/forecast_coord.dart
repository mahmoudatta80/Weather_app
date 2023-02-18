class Coord {
  late final dynamic lon;
  late final dynamic lat;

  Coord.fromJson(Map<String , dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }
}