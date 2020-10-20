import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '8d18f20ad65c62d75c6f989a2bd3061a';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    try {
      NetworkHelper networkHelper = new NetworkHelper(
          '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric');
      var weatherData = await networkHelper.getData();
      return weatherData;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();

    try {
      NetworkHelper networkHelper = new NetworkHelper(
          '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

      var weatherData = await networkHelper.getData();
      return weatherData;
    } catch (e) {
      return null;
    }
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
      return 'Time for shorts ';
    } else if (temp < 10) {
      return 'You might need coffee ';
    } else {
      return 'Bring a jacket just in case';
    }
  }
}
