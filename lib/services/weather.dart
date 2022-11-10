import 'package:tempo_template/entity/coordinates_entity.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'É tempo de 🍦';
    } else if (temp > 20) {
      return 'O tempo está bom para bermuda e 👕';
    } else if (temp < 10) {
      return 'Você precisará de 🧣 e 🧤';
    } else {
      return 'Leve um 🧥';
    }
  }

  String getTemp(int? temp) {
    String tempCity = '-°';

    if (temp != null) {
      tempCity = '$temp°';
    }

    return tempCity;
  }

  String getCity(CoordinatesEntity coordinatesEntity) {
    return coordinatesEntity.getName().isNotEmpty ?
      'em ${coordinatesEntity.getName()}' : '';
  }
}