import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_cubit.dart';
import '../bloc/weather_state.dart';
import '../components/init_widget.dart';
import '../components/success_widget.dart';
import '../weather_model/WeatherModel.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is LoadingWeatherState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SuccessWeatherState) {
          weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
          return SuccessWidget(weatherData: weatherData);
        } else if (state is ErrorWeatherState) {
          return const Text("error");
        }
        else {
          return const InitWidget();
        }
      },
    );
  }
}


