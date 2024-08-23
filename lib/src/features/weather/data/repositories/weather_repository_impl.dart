// import 'dart:io';

// import 'package:dartz/dartz.dart';
// import 'package:open_weather_example_flutter/core/error/exceptions.dart';
// import 'package:open_weather_example_flutter/core/error/failure.dart';
// import 'package:open_weather_example_flutter/src/features/weather/data/api_exception.dart';
// import 'package:open_weather_example_flutter/src/features/weather/data/data_source/remote_data_source.dart';
// import 'package:open_weather_example_flutter/src/features/weather/data/repositories/weather_repository.dart';

// import '../../domain/entities/weather_entities.dart';


// class WeatherRepositoryImpl extends WeatherRepository {
//   final WeatherRemoteDataSource weatherRemoteDataSource;
//   WeatherRepositoryImpl({required this.weatherRemoteDataSource});

//   @override
//   Future<Either<Failure, WeatherEntities>> getCurrentWeather(String cityName)async {
//      try {
//       final result = await weatherRemoteDataSource.getCurrentWeather(cityName);
//       return Right(result);
//     } on ServerException {
//       return const Left(ServerFailure('An error has occurred'));
//     } on SocketException {
//       return const Left(ConnectionFailure('Fail to connect to internet'));
//     }
//   }

  
// }
