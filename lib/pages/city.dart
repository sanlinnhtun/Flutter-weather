import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather/components/weather_result.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  TextEditingController cityName = TextEditingController();
  Map<String, dynamic>? weatherResult;
  double temp = 0;
  String errorMsg = '';
  bool isApiCalling = true;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: cityName,
              decoration: const InputDecoration(labelText: "Enter a city name"),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                String url =
                    'http://api.openweathermap.org/data/2.5/weather?q=${cityName.text}&appid=32ad84d2a41f15df8af1a765bb38c530&units=metric';
                var response = await http.get(Uri.parse(url));
                print(response.statusCode);
                setState(() {
                  if (response.statusCode == 200) {
                    isError = false;
                    weatherResult = jsonDecode(response.body);
                    temp = weatherResult!['main']['temp'];
                  } else {
                    isError = true;
                    errorMsg = jsonDecode(response.body)['message'];
                    print(errorMsg);
                  }
                  isApiCalling = false;
                  setState(() {});
                });
              },
              child: const Text("Get weather")),
          Expanded(
            child: Center(
              child: isApiCalling
                  ? const Text("")
                  : isError
                      ? Text(errorMsg.toUpperCase())
                      : WeatherCard(
                          temp: temp,
                        ),
            ),
          )
        ],
      ),
    );
  }
}
