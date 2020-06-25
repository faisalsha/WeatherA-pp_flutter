import 'package:flutter/material.dart';
import 'package:userdef_climaApp/Screens/location_screen.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:userdef_climaApp/Services/weather.dart';







class LoadingScreen extends StatefulWidget {


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel=WeatherModel();
    var weatherdata=await weatherModel.getLocationWeather();
    return weatherdata;


    Navigator.push(context, MaterialPageRoute
      (builder: (context)=> LocationScreen(locationweather: weatherdata,)));
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }

}