import 'package:open_weather_example_flutter/src/features/weather/domain/repositories/weather_repository.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository weatherRepository;
  GetCurrentWeatherUseCase(this.weatherRepository);
  Future execute(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}
