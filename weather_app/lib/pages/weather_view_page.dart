import 'package:flutter/material.dart';
import 'package:weather_app/widgets/display_weather_information.dart';
import 'package:weather_app/widgets/display_weather_information_latest_week.dart';
import 'package:weather_app/widgets/search_weather_by_city.dart';

class WeatherViewPage extends StatefulWidget {
  const WeatherViewPage({Key? key}) : super(key: key);

  @override
  _WeatherViewPageState createState() => _WeatherViewPageState();
}

class _WeatherViewPageState extends State<WeatherViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        title: Text("Weather Application"),
        backgroundColor: Colors.teal[600],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SearchWeatherByCity(),
            DisplayWeatherInformation(),
            DisplayWeatherInformationLatestWeek(),
          ],
        ),
      ),
    );
  }
}
