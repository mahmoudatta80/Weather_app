import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/current/api_model.dart';
import 'package:weather_app/helper/dio_helper.dart';
import 'package:weather_app/modules/search_screen.dart';

import '../models/forecast/api_forecast_model.dart';

class HomeScreen extends StatefulWidget {
  String? country;
  HomeScreen({this.country,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiModel? apiModel;
  ApiForecastModel? apiForecastModel;
  @override
  void initState() {
    super.initState();
    DioHelper.getData(widget.country??'Mansoura').then((value) {
      setState(() {
        apiModel=ApiModel.fromJson(value.data);
      });
    });
    DioHelper.getDataForecast(widget.country??'Mansoura').then((value) {
      setState(() {
        apiForecastModel=ApiForecastModel.fromJson(value.data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.indigoAccent[200],
      body: FutureBuilder<Response>(
        future: DioHelper.getData(widget.country??'Mansoura'),
        builder: (context, snapshot) {
          if(apiModel==null || apiForecastModel==null) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ),);
                      },
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30,),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  '${apiModel!.name}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'Search',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      '${apiModel!.name}',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.indigoAccent[200],
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'http://openweathermap.org/img/wn/${apiModel!.weather[0].icon}@2x.png',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Text(
                            '${(apiModel!.main.temp - 273).round()}°',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'H:${(apiModel!.main.temp_max - 273).toStringAsFixed(1)}°',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'L:${(apiModel!.main.temp_min - 273).toStringAsFixed(1)}°',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '${DateFormat('EEEE').format(DateTime.parse(apiForecastModel!.list[0].dt_txt)).substring(0,3)}',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[400],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.indigoAccent[200],
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  'http://openweathermap.org/img/wn/${apiModel!.weather[0].icon}@2x.png',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${(apiModel!.main.temp - 273).round()}°',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '${DateFormat('EEEE').format(DateTime.parse(apiForecastModel!.list[8].dt_txt)).substring(0,3)}',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[400],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.indigoAccent[200],
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  'http://openweathermap.org/img/wn/${apiForecastModel!.list[8].weather[0].icon}@2x.png',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${(apiForecastModel!.list[8].main.temp-273).round()}°',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '${DateFormat('EEEE').format(DateTime.parse(apiForecastModel!.list[16].dt_txt)).substring(0,3)}',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[400],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.indigoAccent[200],
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  'http://openweathermap.org/img/wn/${apiForecastModel!.list[16].weather[0].icon}@2x.png',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${(apiForecastModel!.list[16].main.temp-273).round()}°',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '${DateFormat('EEEE').format(DateTime.parse(apiForecastModel!.list[24].dt_txt)).substring(0,3)}',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[400],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.indigoAccent[200],
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  'http://openweathermap.org/img/wn/${apiForecastModel!.list[24].weather[0].icon}@2x.png',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${(apiForecastModel!.list[24].main.temp-273).round()}°',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                //DateFormat('EEEE').format(DateTime.now())
                                //${DateTime.parse(apiForecastModel!.list[32].dt_txt).day}
                                '${DateFormat('EEEE').format(DateTime.parse(apiForecastModel!.list[32].dt_txt)).substring(0,3)}',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[400],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.indigoAccent[200],
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  'http://openweathermap.org/img/wn/${apiForecastModel!.list[32].weather[0].icon}@2x.png',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${(apiForecastModel!.list[32].main.temp-273).round()}°',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

