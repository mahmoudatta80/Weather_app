import 'package:weather_app/models/forecast/forecast_city.dart';
import 'package:weather_app/models/forecast/forecast_listdata.dart';

class ApiForecastModel {
  late final City city;
  late final List<ListData> list;

  ApiForecastModel.fromJson(Map<String , dynamic> json) {
    city=(json['city']!=null?City.fromJson(json['city']):null)!;
    list = List<ListData>.from(json['list'].map((e)=>ListData.fromJson(e)));
  }
}















