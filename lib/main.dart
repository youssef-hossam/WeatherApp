import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/getweather_cubit/getweather_cubit.dart';
import 'package:weatherapp/cubits/getweather_cubit/getweather_state.dart';

import 'home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getWeatherMaterialColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.condition)),
              home: HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getWeatherMaterialColor(String? condition) {
  if (condition == null) {
    return _createMaterialColor(0xFFFFFFFF);
  } else {
    switch (condition.toLowerCase()) {
      case "sunny":
        return Colors.amber;
      case "clear":
        return _createMaterialColor(0xFF1976D2); // Blue
      case "partly cloudy":
        return _createMaterialColor(0xFF78909C); // BlueGrey
      case "cloudy":
        return _createMaterialColor(0xFF9E9E9E); // Grey
      case "overcast":
        return _createMaterialColor(0xFF616161); // Dark Grey
      case "mist":
      case "patchy rain possible":
      case "patchy snow possible":
      case "patchy sleet possible":
      case "patchy freezing drizzle possible":
      case "thundery outbreaks possible":
        return _createMaterialColor(0xFF9E9E9E); // Grey
      case "blowing snow":
      case "blizzard":
        return _createMaterialColor(0xFFFFFFFF); // White
      case "fog":
      case "freezing fog":
      case "light drizzle":
      case "light freezing drizzle":
      case "patchy light drizzle":
      case "patchy light rain":
      case "patchy light snow":
      case "light sleet":
      case "light showers of ice pellets":
        return _createMaterialColor(0xFFE0E0E0); // Light Grey
      case "heavy freezing drizzle":
      case "heavy rain":
      case "heavy rain at times":
      case "heavy snow":
      case "heavy sleet":
      case "heavy showers of ice pellets":
      case "moderate or heavy freezing rain":
      case "moderate or heavy rain":
      case "moderate or heavy rain shower":
      case "moderate or heavy snow":
      case "moderate or heavy sleet showers":
      case "moderate or heavy snow showers":
        return _createMaterialColor(0xFF424242); // Dark Grey
      case "light rain":
      case "moderate rain at times":
      case "moderate rain":
      case "light snow":
      case "patchy moderate snow":
      case "patchy heavy snow":
      case "ice pellets":
      case "light rain shower":
      case "torrential rain shower":
      case "light sleet showers":
      case "light snow showers":
        return _createMaterialColor(0xFF757575); // Grey
      case "light rain with thunder":
      case "moderate or heavy rain with thunder":
      case "patchy light rain with thunder":
      case "patchy light snow with thunder":
      case "moderate or heavy snow with thunder":
        return _createMaterialColor(0xFFFFEB3B); // Yellow
      default:
        return _createMaterialColor(0xFF9E9E9E); // Grey
    }
  }
}

MaterialColor _createMaterialColor(int color) {
  return MaterialColor(color, <int, Color>{
    50: Color(color),
    100: Color(color),
    200: Color(color),
    300: Color(color),
    400: Color(color),
    500: Color(color),
    600: Color(color),
    700: Color(color),
    800: Color(color),
    900: Color(color),
  });
}
