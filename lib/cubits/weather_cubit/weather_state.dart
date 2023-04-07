import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState{}

class WeatherInitialState extends WeatherState{}


class WeatherLoadingState extends WeatherState{}
class WeatherSucessState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherSucessState({required this.weatherModel});

}
class WeatherFailureErrorState extends WeatherState{}
