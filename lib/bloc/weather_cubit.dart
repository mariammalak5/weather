import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:weather_app/bloc/weather_state.dart';
import '../weather_model/WeatherModel.dart';
import '../weather_services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherServices) : super(InitWeatherState());
  WeatherServices weatherServices;
  WeatherModel? weatherModel;
  String? cityName;
  void getWeather({required String cityName})async{
    emit(LoadingWeatherState());
    try {
      weatherModel = await weatherServices.getWeather(cityName: cityName);
      emit(SuccessWeatherState());
    } on Exception catch(e){
      emit(ErrorWeatherState());
      print(e);
    }
  }
}
