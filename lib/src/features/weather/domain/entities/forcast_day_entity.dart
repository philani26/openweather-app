import 'package:equatable/equatable.dart';

class ForcastDayEntity extends Equatable {
  final int dateTime;
  double? tempMin;
  final double tempMax;
  final String description;
  final String icon;

  ForcastDayEntity(
      {required this.dateTime,
      this.tempMin,
      required this.tempMax,
      required this.description,
      required this.icon});

  @override
  List<Object?> get props => [dateTime, tempMin, tempMax, description, icon];
}
