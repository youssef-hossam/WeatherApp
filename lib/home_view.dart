import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/getweather_cubit/getweather_cubit.dart';
import 'package:weatherapp/cubits/getweather_cubit/getweather_state.dart';
import 'package:weatherapp/search_view.dart';
import 'package:weatherapp/widgets/no_weatherinfobody.dart';
import 'package:weatherapp/widgets/weather_infobody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SerachView(),
                      ));
                },
                icon: Icon(
                  Icons.search,
                ))
          ],
          title: const Text("WeatherApp"),
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherIntialState) {
              return NoWeatherBody();
            } else if (state is WeatherinfoLoadedState) {
              return WeatherInfoBody();
            } else {
              return Center(
                child: Text("oops there was an error"),
              );
            }
          },
        ));
  }
}
