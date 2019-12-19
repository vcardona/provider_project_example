import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project_example/WeatherInfo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => WeatherInfo(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider Pattern"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MySpecialHeading(),
              MySpecialContent(),
            ],
          ),
        ),
        floatingActionButton: MyFloatingActionButton(),
      ),
    );
  }
}

class MySpecialHeading extends StatelessWidget {
  Color decideColor(WeatherInfo info) {
    return info.temperatureType == "celcius" ? Colors.green : Colors.deepOrange;
  }

  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        weatherInfo.temperatureType,
        style: TextStyle(fontSize: 25, color: decideColor(weatherInfo)),
      ),
    );
  }
}

class MySpecialContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Temperature Value"),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  Color decideColor(WeatherInfo info) {
    return info.temperatureType == "celcius" ? Colors.green : Colors.deepOrange;
  }

  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);

    return FloatingActionButton(
      backgroundColor: decideColor(weatherInfo),
      onPressed: () {
        String newWeatherType =
            weatherInfo.temperatureType == "celcius" ? "far" : "celcius";
        weatherInfo.temperatureType = newWeatherType;
      },
      tooltip: 'Change  Type',
      child: Icon(Icons.change_history),
    );
  }
}
