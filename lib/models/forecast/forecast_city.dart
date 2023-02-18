import 'package:weather_app/models/forecast/forecast_coord.dart';

class City {
  late final dynamic id;
  late final String name;
  late final Coord coord;
  late final String country;
  late final dynamic population;
  late final dynamic timezone;
  late final dynamic sunrise;
  late final dynamic sunset;

  City.fromJson(Map<String , dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = (json['coord']!=null? Coord.fromJson(json['coord']):null)!;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}