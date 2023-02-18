import 'package:weather_app/models/current/current_clouds.dart';
import 'package:weather_app/models/current/current_coord.dart';
import 'package:weather_app/models/current/current_main.dart';
import 'package:weather_app/models/current/current_sys.dart';
import 'package:weather_app/models/current/current_weather.dart';
import 'package:weather_app/models/current/current_wind.dart';

class ApiModel {
  late final Coord coord;
  late final List<Weather> weather;
  late final String base;
  late final Main main;
  late final dynamic visibility;
  late final Wind wind;
  late final Clouds clouds;
  late final dynamic dt;
  late final Sys sys;
  late final dynamic timezone;
  late final dynamic id;
  late final String name;

  //CairoModel({required this.coord, required this.weather, required this.base, required this.name});

  ApiModel.fromJson(Map<String , dynamic> json) {
    coord = (json['coord']!=null ? Coord.fromJson(json['coord']):null)!;
    weather = List<Weather>.from(json['weather'].map((e)=>Weather.fromJson(e)));
    base = json['base'];
    main = (json['main']!=null ? Main.fromJson(json['main']):null)!;
    visibility = json['visibility'];
    wind = (json['wind']!=null ? Wind.fromJson(json['wind']):null)!;
    clouds = (json['clouds']!=null ? Clouds.fromJson(json['clouds']):null)!;
    dt = json['dt'];
    sys = (json['sys']!=null ? Sys.fromJson(json['sys']):null)!;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
  }
}










