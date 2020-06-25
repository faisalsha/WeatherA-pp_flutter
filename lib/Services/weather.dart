import 'package:userdef_climaApp/Services/location.dart';
import 'package:userdef_climaApp/Services/networking.dart';

const apikey='34fc923872b6aa9f0352d52b9b6c0468';
const OpenWeatherMapUrl='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel{
  double latitude;
  double longitude;

  Future<dynamic> getCityWeather(String cityName) async{
    var urlforcity='$OpenWeatherMapUrl&q=$cityName&appid=$apikey&units=metric';

    NetworkHelper networkHelper=NetworkHelper(url: urlforcity);
    var weatherData=await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(url:
         '$OpenWeatherMapUrl?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');

    var weatherdata = await networkHelper.getData();

    return weatherdata;

  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}