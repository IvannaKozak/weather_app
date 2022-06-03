import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';



const apiKey = '200c1bb212ae79134196c5b19f403ef4';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getLocationWeater() async {
    Location myLocation = Location();
    await myLocation.getCurrentPosition();
    
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    
    return weatherData;

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