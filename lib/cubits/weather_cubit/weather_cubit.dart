import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/services/weather_service.dart';

import '../../models/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;
  String? cityName;
  WeatherCubit(this.weatherService) : super(WeatherInitialState());
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSucessState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureErrorState());
    }
  }
}
