import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/getweather_cubit/getweather_state.dart';
import 'package:weatherapp/models/weather_model.dart';

import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  WeatherModel? weatherModel;
  GetWeatherCubit() : super(WeatherIntialState());

  getweather(String cityname) async {
    try {
      weatherModel =
          await WeatherServices(Dio()).getcurrentweather(cityname: cityname);
      emit(WeatherinfoLoadedState());
    } on Exception catch (e) {
      emit(FaliureWeatherState());
    }
  }
}
