import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoon = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 4,
        title: Text(
          "Today's Webtoon",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: FutureBuilder(
        future: webtoon,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text("there is Data");
          } else {
            return const Text("loading...");
          }
        },
      ),
    );
  }
}
