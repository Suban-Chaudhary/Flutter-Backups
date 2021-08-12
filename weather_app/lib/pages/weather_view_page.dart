import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/controllers/weather_page_data_controller.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/models/weather_page_data.dart';
import 'package:weather_app/provider/weather_data_provider.dart';

// ignore: must_be_immutable
class WeatherViewPage extends ConsumerWidget {
  final TextEditingController searchFieldController = TextEditingController();
  WeatherPageDataController weatherPageDataController =
      WeatherPageDataController();
  WeatherPageData weatherPageData =
      WeatherPageData(searchText: "", weatherInfo: WeatherInfo());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    weatherPageDataController =
        ref.watch(weatherPageDataControllerProvider.notifier);
    weatherPageData = ref.watch(weatherPageDataControllerProvider);

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        title: Text("Weather Application"),
        backgroundColor: Colors.teal[600],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [_searchField(), _weatherdisplay()],
        ),
      ),
    );
  }

  Widget _searchField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),
      child: TextField(
        onSubmitted: (_input) {
          if (_input != "") {
            weatherPageDataController.updateTextString(_input);
          }
        },
        controller: searchFieldController,
        style: TextStyle(
          color: Colors.teal,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _weatherdisplay() {
    return Container(
      child: Column(
        children: <Widget>[
          Text("${weatherPageData.weatherInfo!.name}"),
          Text("${weatherPageData.weatherInfo!.base}"),
          weatherPageData.weatherInfo!.timezone == null
              ? Text("")
              : Text("${weatherPageData.weatherInfo!.timezone}"),
          weatherPageData.weatherInfo!.visibility == null
              ? Text("")
              : Text("${weatherPageData.weatherInfo!.visibility}"),
          weatherPageData.weatherInfo!.coord!.lat == 0
              ? Text("")
              : Text("${weatherPageData.weatherInfo!.coord!.lat}"),
          weatherPageData.weatherInfo!.coord!.lon == 0
              ? Text("")
              : Text("${weatherPageData.weatherInfo!.coord!.lon}"),
        ],
      ),
    );
  }
}
