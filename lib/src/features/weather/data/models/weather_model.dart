import 'package:open_weather_example_flutter/src/features/weather/domain/entities/temperature.dart';

// class WeatherModel extends WeatherEntities {
//   const WeatherModel({
//     required String cityName,
//     required String main,
//     required String description,
//     required String iconCode,
//     required Temperature temperature,
//     required int pressure,
//     required int humidity,
//   }) : super(
//             cityName: cityName,
//             main: main,
//             description: description,
//             iconCode: iconCode,
//             temperature: temperature,
//             pressure: pressure,
//             humidity: humidity);

//   factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
//         cityName: json['name'] as String? ?? '',
//         main: json['weather'][0]['main'] as String? ?? '',
//         description: json['weather'][0]['description'] as String? ?? '',
//         iconCode: json['weather'][0]['icon'] as String? ?? '',
//         temperature: json['weather'][0]['temp'] ?? 0.0,
//         pressure: json['weather'][0]['pressure'] ?? 0,
//         humidity: json['weather'][0]['humidity'] ?? 0,
//       );

//   WeatherEntities toEntity() => WeatherEntities(
//       cityName: cityName,
//       main: main,
//       description: description,
//       iconCode: iconCode,
//       temperature: temperature,
//       pressure: pressure,
//       humidity: humidity);
// }

class WeatherModel {
  final Temperature temp;
  final Temperature? minTemp;
  final Temperature maxTemp;
  final String icon;
  final String? date;

  WeatherModel({
    required this.temp,
    this.minTemp,
    required this.maxTemp,
    required this.icon,
    this.date,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        temp: Temperature.celsius((json["main"]['temp'] as num?)!.toDouble()),
        minTemp:
            Temperature.celsius((json["main"]['temp_min'] as num?)!.toDouble()),
        maxTemp:
            Temperature.celsius((json["main"]['temp_max'] as num?)!.toDouble()),
        icon: json['weather'][0]['icon'],
        date: json['dt_txt'],
      );

  String get iconUrl => "https://openweathermap.org/img/wn/$icon.png";
}
