class WeatherModel {
  final String cityname;
  final String image;
  final DateTime date;
  final double temp;
  final double mintemp;
  final double maxtemp;
  final String condition;

  WeatherModel({
    required this.cityname,
    required this.image,
    required this.date,
    required this.condition,
    required this.maxtemp,
    required this.mintemp,
    required this.temp,
  });
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityname: json['location']['name'],
        date: DateTime.parse(
          json['current']['last_updated'],
        ),
        condition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
}
