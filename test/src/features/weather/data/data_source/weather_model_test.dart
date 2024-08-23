import 'dart:convert';

import 'package:open_weather_example_flutter/src/features/weather/domain/entities/temperature.dart';

import '../helpers/json_reader.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/models/weather_model.dart';
import 'package:test/test.dart';

void main() {
  final testWeatherModel = WeatherModel(

    temp:  Temperature.celsius(12.0),
    maxTemp: Temperature.celsius(7.0),
    minTemp: Temperature.celsius(23.0),
    icon: '',
    date: '21/08/2024'

      
      );

  test('Should be a subclass of weather entity', () async {
    expect(testWeatherModel, isA<WeatherModel>());
  });

  test('Should return a valid model', () async {
    final Map<String, dynamic> jsonMap = json.decode(
      readJson(
          'src/features/weather/data/helpers/dummy_data/dummy_weather_res.json'),
    );
    //act
    final result = WeatherModel.fromJson(jsonMap);
//assert
    expect(result, equals(testWeatherModel));
  });
}
