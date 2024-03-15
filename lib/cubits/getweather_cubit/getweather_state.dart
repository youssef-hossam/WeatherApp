import 'package:weatherapp/models/weather_model.dart';

class WeatherState {}

class WeatherinfoLoadedState extends WeatherState {
  get weatherModel => null;
}

class WeatherIntialState extends WeatherState {}

class FaliureWeatherState extends WeatherState {}
