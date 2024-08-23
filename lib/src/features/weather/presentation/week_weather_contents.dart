import 'package:flutter/material.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/models/forecast_model.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/weather_icon_image.dart';

class WeekWeatherContents extends StatelessWidget {
  const WeekWeatherContents({super.key, required this.data});

  final ForecastDay data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final weatherList = data.list;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        children: weatherList.isEmpty
            ? [Text('No weather data available', style: textTheme.bodySmall)]
            : weatherList.map((weather) {
                final temp = weather.temp.celsius.toInt().toString();
                const fontWeight = FontWeight.normal;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        weather.date!,
                        style: textTheme.bodySmall!.copyWith(
                            color: Colors.white, fontWeight: fontWeight),
                      ),
                      const SizedBox(width: 8),
                      WeatherIconImage(iconUrl: weather.iconUrl, size: 80),
                      const SizedBox(width: 8),
                      Text(
                        '$temp°',
                        style: textTheme.bodyMedium!.copyWith(
                            color: Colors.white, fontWeight: fontWeight),
                      ),
                    ],
                  ),
                );
              }).toList(),
      ),
    );
  }
}
