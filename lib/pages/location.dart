import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather/components/weather_result.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  @override
  void initState(){
    super.initState();
    getLocation();
  }

  Map<String, dynamic>? weatherResult;
  double temp = 0;
  String errorMsg = '';
  bool isApiaClling = true;
  bool isError = false;
  Position? myLocation;


  getWeather() async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${myLocation!.latitude}&lon=${myLocation!.longitude}&appid=a282b757c13c4bae4b14df933c62959c&units=metric';

    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      isError = false;
      weatherResult = jsonDecode(response.body);
      temp = weatherResult!['main']['temp'];
    } else {
      isError = true;
      errorMsg = jsonDecode(response.body)['message'];
      print(errorMsg);
    }
    isApiaClling = false;
    setState(() {});
  }

  getLocation() async {
    var permission = await Geolocator.checkPermission();
    print(permission);
    if ( permission == LocationPermission.denied){
      permission= await Geolocator.requestPermission();
    }
    var location= await Geolocator.getCurrentPosition();
    print(location);
    setState(() {
      myLocation=location;
    });
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isApiaClling
          ? const Text("")
          : isError
              ? Text(errorMsg.toUpperCase())
              : WeatherCard(temp: temp),
    );
  }
}
