import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/data_source/remote_data_source.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/repositories/weather_repository.dart';
import 'package:open_weather_example_flutter/src/features/weather/domain/usecase/get_current_weather.dart';

@GenerateMocks(
  [WeatherRepository, WeatherRemoteDataSource, GetCurrentWeatherUseCase],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
