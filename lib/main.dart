import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/helper/dio_helper.dart';
import 'package:weather_app/modules/home_screen.dart';

void main() {
  DioHelper.initState();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}