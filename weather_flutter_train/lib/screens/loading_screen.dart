import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_flutter_train/screens/location_screen.dart';
import 'package:weather_flutter_train/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => LocationScreen(
              locationWeather: weatherData,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
    ));
  }
}
