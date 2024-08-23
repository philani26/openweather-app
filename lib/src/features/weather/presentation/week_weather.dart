import 'package:flutter/material.dart';
import 'package:open_weather_example_flutter/src/features/weather/application/providers.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/models/forecast_model.dart';

import 'package:open_weather_example_flutter/src/features/weather/presentation/weather_icon_image.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/week_weather_contents.dart';
import 'package:provider/provider.dart';

class WeekWeather extends StatelessWidget {
  const WeekWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherProvider, (String, ForecastDay?, bool, String?)>(
        selector: (context, provider) => (
              provider.city,
              provider.hourlyWeatherProvider,
              provider.isLoading,
              provider.errorMessage
            ),
        builder: (context, data, _) {
          final isLoading = data.$3;
          final weekWeather = data.$2;
          final errorMessage = data.$4;
          return Expanded(
            child: ListView(
              children: [
                const SizedBox(width: 16),
                if (isLoading) const CircularProgressIndicator(),
                if (errorMessage != null)
                  Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                if (weekWeather != null) WeekWeatherContents(data: weekWeather),
              ],
            ),
          );
        });
  }
}
