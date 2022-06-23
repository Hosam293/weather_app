import 'package:wea_app/Model/CurrentWeatherModel.dart';
import 'package:wea_app/Model/WeatherModel.dart';

abstract class WeaStates{}

class WeaInitialState extends WeaStates{}

class CurrentWeatherLoadingState extends WeaStates{}
class CurrentWeatherSuccessDataState extends WeaStates{

}
class CurrentWeatherErrorDataState extends WeaStates{
  CurrentWeaModel? model;

  CurrentWeatherErrorDataState(this.model);
}
class ForecastWeatherLoadingState extends WeaStates{}
class ForecastWeatherSuccessState extends WeaStates{}
class ForecastWeatherErrorState extends WeaStates{}
