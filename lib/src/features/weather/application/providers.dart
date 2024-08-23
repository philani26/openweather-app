import 'package:flutter/cupertino.dart';

import 'package:open_weather_example_flutter/core/error/exceptions.dart';
import 'package:open_weather_example_flutter/src/api/api.dart';
import 'package:open_weather_example_flutter/src/api/api_keys.dart';
import 'package:open_weather_example_flutter/src/api/http_weather_repository.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/models/forecast_model.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  late BuildContext context;
  HttpWeatherRepository repository = HttpWeatherRepository(
    api: OpenWeatherMapAPI(sl<String>(instanceName: 'api_key')),
    client: http.Client(),
  );

  String _city = 'London';
  WeatherModel? currentWeatherProvider;
  ForecastDay? hourlyWeatherProvider;
  bool isLoading = false;
  String? errorMessage;
  String get city => _city;

  set city(String value) {
    _city = value;
    notifyListeners();
  }

  Future<void> getWeatherData() async {
    isLoading = true;
    errorMessage = null;
    // notifyListeners();

    try {
      WeatherModel weather = await repository.getWeather(_city);
      currentWeatherProvider = weather;
      await getForecastData();
    } catch (e) {
      errorMessage = 'Failed to load weather data';

      ServerException();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getForecastData() async {
    isLoading = true;
    errorMessage = null;
  

    try {
      ForecastDay forecast = await repository.getForecast(_city);
      hourlyWeatherProvider = forecast;
    } catch (e) {
      errorMessage = 'Failed to load forecast data';

      ServerException();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
