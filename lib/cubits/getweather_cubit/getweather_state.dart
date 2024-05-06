import 'package:weatherapp/models/weather_model.dart';

class WeatherState {}

class WeatherinfoLoadedState extends WeatherState {
  WeatherModel weatherModel;
  WeatherinfoLoadedState({required this.weatherModel});
}

class WeatherIntialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class FaliureWeatherState extends WeatherState {
  String errorMessage;
  FaliureWeatherState({required this.errorMessage});
}
