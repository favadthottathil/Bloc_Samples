import 'dart:convert';

import 'package:weather_app/Data/Data_Provider/weather_data_provider.dart';
import 'package:weather_app/Model/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<List<WeatherModel>> getCurrentWeather() async {
    try {
      String cityName = 'London';

      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      final List datas = data['list'];

      print(datas);

      return datas.map((item) => WeatherModel.fromMap(item)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
