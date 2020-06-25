import 'package:flutter/material.dart';
import 'package:userdef_climaApp/Screens/city_screen.dart';
import 'package:userdef_climaApp/utilities/constants.dart';
import 'package:userdef_climaApp/Services/weather.dart';



class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});
  final locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather=WeatherModel();
  int temperature;
  String cityName;
  String waetherIcon;
  String weatherMessage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updateUI(widget.locationweather);
  }

  void updateUI(dynamic weatherdata){
    setState(() {

      if(weatherdata==null){
        temperature=0;
        cityName='';
        weatherMessage='';
        waetherIcon='error';
        return;

      }


    double temp=weatherdata['main']['temp'];
    temperature=temp.toInt();
    var condition=weatherdata['weather'][0]['id'];
    waetherIcon=weather.getWeatherIcon(condition);
    weatherMessage=weather.getMessage(temperature);
    cityName=weatherdata['name'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(  Colors.white.withOpacity(0.8), BlendMode.dstATop)
          )
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () async{
                        var weatherData=await weather.getLocationWeather();
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 20.0,
                      ),
                    ),
                    FlatButton(
                      onPressed: () async{
                        var typedName=await Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen()));
                        if(typedName!=null){
                          var weatherData=await weather.getCityWeather(typedName);
                          updateUI(weatherData);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 20.0,
                      ),
                    ),
                  ],

                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        waetherIcon,
                        style: kConditionTextStyle,
                      ),

                    ],
                  ),

                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    '$weatherMessage in $cityName',
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



