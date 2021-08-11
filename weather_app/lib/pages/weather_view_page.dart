import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherViewPage extends ConsumerWidget {
  final TextEditingController searchFieldController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        title: Text("Weather Application"),
        backgroundColor: Colors.teal[600],
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            _searchField(),
          ],
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
}
