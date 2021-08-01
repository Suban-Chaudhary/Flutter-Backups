import 'package:flutter/material.dart';

class SearchWeatherByCity extends StatefulWidget {
  const SearchWeatherByCity({Key? key}) : super(key: key);

  @override
  SearchWeatherByCityState createState() => SearchWeatherByCityState();
}

class SearchWeatherByCityState extends State<SearchWeatherByCity> {
  final searchTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
