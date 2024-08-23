import 'package:mockito/mockito.dart';
import 'package:open_weather_example_flutter/core/error/exceptions.dart';

import 'package:open_weather_example_flutter/src/constants/constants.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/data_source/remote_data_source.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/models/weather_model.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import '../helpers/http_test_data/test_helper.mocks.dart';
import '../helpers/json_reader.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceImpl weatherRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherRemoteDataSourceImpl =
        WeatherRemoteDataSourceImpl(client: mockHttpClient);
  });
  const cityName = 'London';
  group('get current weather', () {
    test('should return weather model when the status is 200', () async {
      when(
        mockHttpClient.get(
          Uri.parse(Urls.currentWeatherByName(cityName)),
        ),
      ).thenAnswer(
        (_) async => http.Response(
            readJson(
                'src/features/weather/data/helpers/dummy_data/dummy_weather_res.json'),
            200),
      );
      final result =
          await weatherRemoteDataSourceImpl.getCurrentWeather(cityName);

      expect(result, isA<WeatherModel>());
    });
    test('should throw a server exception when the response code is 404',
        () async {
      when(
        mockHttpClient.get(
          Uri.parse(Urls.currentWeatherByName(cityName)),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not found', 404),
      );

      expect(
          () async =>
              await weatherRemoteDataSourceImpl.getCurrentWeather(cityName),
          throwsA(isA<ServerException>()));
    });
  });
}
