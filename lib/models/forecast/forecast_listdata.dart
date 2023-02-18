import 'package:weather_app/models/forecast/forecast_clouds.dart';
import 'package:weather_app/models/forecast/forecast_main.dart';
import 'package:weather_app/models/forecast/forecast_sys.dart';
import 'package:weather_app/models/forecast/forecast_weather.dart';
import 'package:weather_app/models/forecast/forecast_wind.dart';

class ListData {
  late final dynamic dt;
  late final Main main;
  late final List<Weather> weather;
  late final Clouds clouds;
  late final Wind wind;
  late final dynamic visibility;
  late final dynamic pop;
  late final Sys sys;
  late final String dt_txt;

  ListData.fromJson(Map<String , dynamic> json) {
    dt = json['dt'];
    main = (json['main']!=null ? Main.fromJson(json['main']):null)!;
    weather = List<Weather>.from(json['weather'].map((e)=>Weather.fromJson(e)));
    clouds = (json['clouds']!=null ? Clouds.fromJson(json['clouds']):null)!;
    wind = (json['wind']!=null ? Wind.fromJson(json['wind']):null)!;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = (json['sys']!=null ? Sys.fromJson(json['sys']):null)!;
    dt_txt = json['dt_txt'];
  }
}