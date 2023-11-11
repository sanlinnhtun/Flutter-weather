import 'package:http/http.dart' as http;
import 'dart:convert';

Future<double> getWeather(city) async {
  String url =
      'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=32ad84d2a41f15df8af1a765bb38c530&units=metric';
  ;

  var response = await http.get(Uri.parse(url));
  print(response.statusCode);

  if (response.statusCode == 200) {
    // isError = false;
    var weatherResult = jsonDecode(response.body);
    return weatherResult!['main']['temp'];
  } else {
    // isError = true;
    // errorMsg = jsonDecode(response.body)['message'];
    // print(errorMsg);
    throw Exception("City not fount");
  }
  // isApiaClling = false;
  // setState(() {});
}
