import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:open_weather_example_flutter/core/error/failure.dart';
import 'package:open_weather_example_flutter/src/api/api.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/api_exception.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/models/forecast_model.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/models/weather_model.dart';

class HttpWeatherRepository {
  final OpenWeatherMapAPI api;
  final http.Client client;

  HttpWeatherRepository({required this.api, required this.client});
  
  Future<WeatherModel> getWeather(String city) => GetDataWeather(
        uri: api.weather(city),
        builder: (data) => WeatherModel.fromJson(data),
      );

  Future<ForecastDay> getForecast(String city) => GetDataWeather(
        uri: api.forecast(city),
        builder: (data) => ForecastDay.fromJson(data),
      );


  Future<T> GetDataWeather<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    final res = await client.get(uri);
    switch (res.statusCode) {
      case 200:
        return builder(json.decode(res.body));
      case 404:
        throw const ServerFailure('Page not found');
      case 426:
        throw const ServerFailure('API key has expired');
      default:
        throw UnknownException();
    }
  }
}
