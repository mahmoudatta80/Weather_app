class Sys {
  late final dynamic type;
  late final dynamic id;
  late final String country;
  late final dynamic sunrise;
  late final dynamic sunset;

  Sys.fromJson(Map<String , dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}