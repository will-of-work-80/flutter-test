import 'package:flutter/material.dart';
import 'package:flutter_application_test/navigation.dart';
import 'package:flutter_application_test/weather/presentation/current_weather.dart';

class WeatherTestPage extends StatelessWidget {
  const WeatherTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Open Weather API テスト'),
        ),
        drawer: NavigationComponentWidget(),
        body: Container(
          // 横幅をいっぱい使う
          width: double.infinity,
          height: double.infinity,
          color: Colors.lightBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CurrentWeather(),
            ],
          ),
        ));
  }
}
