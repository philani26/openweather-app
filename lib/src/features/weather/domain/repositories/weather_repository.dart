import 'package:dartz/dartz.dart';
import 'package:open_weather_example_flutter/core/error/failure.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherModel>> getCurrentWeather(String cityName);
}
