part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherOnLoadState extends WeatherState{
  final List<ForecastData> forecastData;
  final WeatherData weatherData;
  WeatherOnLoadState({required this.forecastData, required this.weatherData});
  @override
  List<Object?> get props => [forecastData, weatherData];
}
