import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final apikey = '09d11ef1c84d4224a16152430241203%20';
  WeatherServices(this.dio);

  Future<WeatherModel> getcurrentweather({required String cityname}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apikey&q=$cityname&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errormessage =
          e.response?.data['error']['message'] ?? 'oops there was an error';

      throw Exception(errormessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there was an error");
    }
  }
}
