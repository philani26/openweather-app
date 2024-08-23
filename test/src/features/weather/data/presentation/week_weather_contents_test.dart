
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/models/forecast_model.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/models/weather_model.dart';
import 'package:open_weather_example_flutter/src/features/weather/domain/entities/temperature.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/weather_icon_image.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/week_weather_contents.dart';

void main() {
  group('WeekWeatherContents', () {
    late ForecastDay mockForecastDayWithData;
    late ForecastDay mockForecastDayWithoutData;

    setUp(() {
      mockForecastDayWithData = ForecastDay(list: [
        WeatherModel(
          date: '2024-08-23',
          temp: Temperature.celsius(25.0),
          maxTemp: Temperature.celsius(40.2),
          icon: 'http://openweathermap.org/img/wn/04d@2x.png',
         
        ),
        WeatherModel(
          date: '2024-08-24',
          temp: Temperature.celsius(26.0),
          maxTemp: Temperature.celsius(28.9),
          icon: 'http://openweathermap.org/img/wn/04d@2x.png',
        
        )
      ]);

      mockForecastDayWithoutData = ForecastDay(list: []);
    });
    testWidgets('displays weather data correctly when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
        body: WeekWeatherContents(data: mockForecastDayWithData),
      )));
      expect(find.byType(Column),
          findsNWidgets(mockForecastDayWithData.list.length));

      expect(find.text('2024-08-23'), findsOneWidget);
      expect(find.text('2024-08-24'), findsOneWidget);
      expect(find.text('25°'), findsOneWidget);

      expect(find.byType(WeatherIconImage),
          findsNWidgets(mockForecastDayWithData.list.length));
    });

    testWidgets('displays no data message when weatherList is empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: WeekWeatherContents(data: mockForecastDayWithoutData),
        ),
      ));
      expect(find.text('No weather data available'), findsOneWidget);
    });
  });
}
