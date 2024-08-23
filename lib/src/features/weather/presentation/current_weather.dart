import 'package:flutter/material.dart';
import 'package:open_weather_example_flutter/src/constants/app_colors.dart';
import 'package:open_weather_example_flutter/src/features/weather/application/providers.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/models/weather_model.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/weather_icon_image.dart';
import 'package:provider/provider.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherProvider, (String, WeatherModel?, bool, String?)>(
        selector: (context, provider) => (
        provider.city,
        provider.currentWeatherProvider,
        provider.isLoading,
        provider.errorMessage
      ),
        builder: (context, data, _) {
          final isLoading = data.$3;
          final weatherData = data.$2;
          final errorMessage = data.$4;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(data.$1, style: Theme.of(context).textTheme.headlineMedium),
              //TODO account for null, errors and loading states
             if( isLoading)
             const CircularProgressIndicator(),
              if(errorMessage != null)
             Text( errorMessage,style: const TextStyle(color: AppColors.accentColor) ,),
             
             if (weatherData != null)
               CurrentWeatherContents(data: weatherData),
            ],
          );
        });
  }
}

class CurrentWeatherContents extends StatelessWidget {
  const CurrentWeatherContents({super.key, required this.data});

  final WeatherModel data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final temp = data.temp.celsius.toInt().toString();
    final minTemp = data.minTemp!.celsius.toInt().toString();
    final maxTemp = data.maxTemp.celsius.toInt().toString();
    final highAndLow = 'H:$maxTemp° L:$minTemp°';
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WeatherIconImage(iconUrl: data.iconUrl, size: 120),
        Text(temp, style: textTheme.displayMedium),
        Text(highAndLow, style: textTheme.bodyMedium),
      ],
    );
  }
}
