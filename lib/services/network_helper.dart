import 'package:http/http.dart' as http;
import 'dart:developer' as dev;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tempo_template/entity/coordinates_entity.dart';
import 'package:tempo_template/utilities/convert_object_utils.dart';

class NetworkHelper {

  Future<CoordinatesEntity> getData(double latitude, double longitude) async {

    String apiKey = dotenv.env['API_KEY']!;
    String urlApiWeather = dotenv.env['URL_API_WEATHER']!;

    Uri url = Uri
        .parse('$urlApiWeather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    http.Response? response;

    try {
      response = await http.get(url);
    } catch(errorApi) {
      dev.log('Error GET api Weather: $errorApi');
    }

    late CoordinatesEntity coordinatesEntity;

    if (response != null && response.statusCode == 200) {
      var data = response.body;
      
      Map<String, dynamic> jsonConverter = ConvertObjectUtils
          .converterStringInJson(data);

      try {
        coordinatesEntity = CoordinatesEntity
            .fromJson(jsonConverter);
      } catch(error) {
        dev.log('Error build from Json: $error');
      }

    } else {
      dev.log(response != null ? '${response.statusCode}' : "${-1}");
    }

    return coordinatesEntity;
  }
}