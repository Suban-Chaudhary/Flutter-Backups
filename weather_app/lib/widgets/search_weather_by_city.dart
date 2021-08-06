import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/controllers/weather_page_data_controller.dart';
import 'package:weather_app/models/weather_page_data.dart';
import 'package:weather_app/pages/weather_view_page.dart';

class SearchWeatherByCity extends ConsumerWidget {
  late WeatherPageDataController _weatherPageDataController =
      WeatherPageDataController();
  late WeatherPageData _weatherPageData;
  late TextEditingController searchTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // _weatherPageDataController =
    //     ref.watch(weatherPageDataControllerProvider.notifier);
    // _weatherPageData = ref.watch(weatherPageDataControllerProvider);

    return Container(
      height: 50,
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        controller: searchTextEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search Weather By City...",
          prefixIcon: Icon(Icons.search, color: Colors.teal),
        ),
        textAlignVertical: TextAlignVertical.center,
        onSubmitted: (_input) =>
            {_weatherPageDataController.updateTextString(_input)},
      ),
    );
  }
}
