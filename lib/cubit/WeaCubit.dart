import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wea_app/Controller/DioHelper.dart';
import 'package:wea_app/Model/CurrentWeatherModel.dart';
import 'package:wea_app/Model/WeatherModel.dart';
import 'package:wea_app/cubit/WeaStates.dart';

class WeaCubit extends Cubit<WeaStates> {
  WeaCubit() : super(WeaInitialState());

  WeaCubit get(context) => BlocProvider.of<WeaCubit>(context);


  List<String>time =
  [
    '12PM',
    '15PM',
    '15PM',
    '18PM',
    '21PM',
    '00AM',
    '03AM',

  ];
  List<String>days =
  [
    'Firday',
    'SunDay',
    'Mond',
    '09AM',
    '12PM',
    '15PM',
    '18PM',
    '21PM',
  ];
  CurrentWeaModel? currentWeaModel;
  String city='egypt';

  void getCurrentWeatherData({ String? cityName}) {
    emit(CurrentWeatherLoadingState());
    DioHelper.getData(url: 'data/2.5/weather', query:
    {
      'q': city,
      'appid': '99a739dfc2a9f2c4372e7a01cffb0c78',
      'units':'metric'
    }).then((value) {
      print(value.data);
      currentWeaModel =CurrentWeaModel.fromJson(value.data);
      emit(CurrentWeatherSuccessDataState());
    }).catchError((error)
    {
      print(error.toString());
      emit(CurrentWeatherErrorDataState(currentWeaModel));
    });
  }
  WeatherData? weatherData;

  void getForecastWeaData({ String? cityName}) {
    emit(ForecastWeatherLoadingState());
    DioHelper.getData(url: 'data/2.5/forecast', query:
    {
      'q': city,
      'appid': '99a739dfc2a9f2c4372e7a01cffb0c78',
      'units':'metric',
      'cnt':'7'
    }).then((value) {
      print(value.data);
      weatherData =WeatherData.fromJson(value.data);
      print('${weatherData!.list.length}asjaskjdaksjdhajsdh');
      emit(ForecastWeatherSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ForecastWeatherErrorState());
    });
  }

}
