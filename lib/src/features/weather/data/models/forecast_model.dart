import 'package:intl/intl.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/models/weather_model.dart';

class ForecastDay {
  final List<WeatherModel> list;

  const ForecastDay({required this.list});

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    var weatherList = (json["list"] as List)
        .map((item) => WeatherModel.fromJson(item))
        .toList();

    final Map<String, WeatherModel> dayMap = {};
    final todayDate = DateFormat('EEE').format(DateTime.now());

    for (var weather in weatherList) {
      final dateTime =
          weather.date != null ? DateTime.parse(weather.date!) : null;
      if (dateTime != null) {
        final date = DateFormat('EEE').format(dateTime);
        final dayName = date == todayDate ? 'Today' : _getDayName(dateTime);

        if (!dayMap.containsKey(date)) {
          dayMap[date] = WeatherModel(
            temp: weather.temp,
            minTemp: weather.minTemp,
            maxTemp: weather.maxTemp,
            icon: weather.icon,
            date: dayName,
          );
        }
      }
    }

    final flattenedList = dayMap.values.toList();

    return ForecastDay(list: flattenedList);
  }

  static String _getDayName(DateTime dateTime) {
    return DateFormat('EEE').format(dateTime);
  }
}
