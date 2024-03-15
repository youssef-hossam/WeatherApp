import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/getweather_cubit/getweather_cubit.dart';
import 'package:weatherapp/main.dart';

import '../models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  WeatherInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              getWeatherMaterialColor(weatherModel.condition),
              getWeatherMaterialColor(weatherModel.condition)[300]!,
              getWeatherMaterialColor(weatherModel.condition)[50]!,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      weatherModel.cityname,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
                      style: TextStyle(fontSize: 26),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network("https:${weatherModel.image}"),
                Text(
                  "${weatherModel.temp}",
                  style: TextStyle(fontSize: 26),
                ),
                Column(
                  children: [
                    Text("Max Temp :${weatherModel.maxtemp}"),
                    Text("Min Temp :${weatherModel.mintemp}"),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weatherModel.condition,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
