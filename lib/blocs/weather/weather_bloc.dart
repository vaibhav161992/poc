import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poc/core/consts/app_consts.dart';
import 'package:poc/domain/model/weather_data_model.dart';
import 'package:poc/domain/model/weather_forecast_model.dart';

import '../../infrastructure/network/laf_api_client.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final apiClient = GetIt.I<LafApiClient>();

  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeatherEvent>(getWeather);
  }

  FutureOr<void> getWeather(
      GetWeatherEvent event, Emitter<WeatherState> emit) async {
    print('Getting weather');
    final response = await apiClient.get('${AppConsts.baseURL}/forecast',
        queryParameters: {
          'q': event.cityName,
          'appid': AppConsts.appId,
          'units': AppConsts.metric
        });
    List<ForecastData> forecastData = forecastDataFromJson(jsonEncode(response['list']));
    final response2 = await apiClient.get('${AppConsts.baseURL}/weather',
        queryParameters: {
          'q': event.cityName,
          'appid': AppConsts.appId,
          'units': AppConsts.metric
        });
    WeatherData weatherData = weatherDataFromJson(jsonEncode(response2));
    emit(WeatherOnLoadState(weatherData:weatherData,forecastData: forecastData));
  }
}
