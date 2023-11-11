import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.temp});

  final double temp;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(8),
            child: Text("Current Temperature is $temp"),)
          ],
          // const Image.asset('images/1044986_97098-OKREHU-948.jpg'),
          // const Image(image: AssetImage('images/sunny.jpg')),
        ),
      ),
    );
  }
}
