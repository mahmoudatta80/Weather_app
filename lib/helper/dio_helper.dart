import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:weather_app/models/forecast/api_forecast_model.dart';
import 'package:weather_app/models/current/api_model.dart';

class DioHelper {
  static late Dio dio;
  static late Dio dioForecast;

  //current day api  https://api.openweathermap.org/data/2.5/weather?q=cairo&appid=13e512bb9594d5d7e292f42b97d8ca75
  //5 days forecast api  https://api.openweathermap.org/data/2.5/forecast?q=cairo&appid=13e512bb9594d5d7e292f42b97d8ca75
  static initState() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/',
        receiveDataWhenStatusError: true,
      ),
    );
    dioForecast = Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(String value) async{
    return await dio.get(
      'data/2.5/weather',
      queryParameters: {
        'q':value,
        'appid':'13e512bb9594d5d7e292f42b97d8ca75',
      },
    );
  }

  static Future<Response> getDataForecast(String value) async{
    return await dio.get(
      'data/2.5/forecast',
      queryParameters: {
        'q':value,
        'appid':'13e512bb9594d5d7e292f42b97d8ca75',
      },
    );
  }
}