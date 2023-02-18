import 'package:flutter/material.dart';
import 'package:weather_app/modules/home_screen.dart';

class SearchScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onFieldSubmitted:(value) {
                  Navigator.of(context)
                      .pushAndRemoveUntil(MaterialPageRoute(
                    builder: (context) => HomeScreen(country: value,),
                  ),
                        (route) => false,
                  );
                },
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30,),
                  ),
                  label: Center(
                    child: Text(
                      'Search For Country',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
