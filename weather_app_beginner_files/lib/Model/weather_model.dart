// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherModel {
  final dynamic currentTemp;

  final dynamic currentSky;

  final dynamic currentPressure;

  final dynamic currentWindSpeed;

  final dynamic currentHumidity;

  final dynamic hourlyTemp;

  final dynamic time;
  WeatherModel({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.hourlyTemp,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentTemp': currentTemp,
      'currentSky': currentSky,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    // final currentWeatherData = map['list'][0];

    // final currentTemp = currentWeatherData['main']['temp'];
    // final currentSky = currentWeatherData['weather'][0]['main'];
    // final currentPressure = currentWeatherData['main']['pressure'];
    // final currentWindSpeed = currentWeatherData['wind']['speed'];
    // final currentHumidity = currentWeatherData['main']['humidity'];

    return WeatherModel(
      currentTemp: map['main']['temp'],
      currentSky: map['weather'][0]['main'],
      currentPressure: map['main']['pressure'],
      currentWindSpeed: map['wind']['speed'],
      currentHumidity: map['main']['humidity'],
      hourlyTemp: map['main']['temp'].toString(),
      time: map['dt_txt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) => WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(currentTemp: $currentTemp, currentSky: $currentSky, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.currentTemp == currentTemp && other.currentSky == currentSky && other.currentPressure == currentPressure && other.currentWindSpeed == currentWindSpeed && other.currentHumidity == currentHumidity;
  }

  @override
  int get hashCode {
    return currentTemp.hashCode ^ currentSky.hashCode ^ currentPressure.hashCode ^ currentWindSpeed.hashCode ^ currentHumidity.hashCode;
  }
}
