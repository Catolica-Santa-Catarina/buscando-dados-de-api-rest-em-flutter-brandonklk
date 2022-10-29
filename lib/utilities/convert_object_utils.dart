import 'dart:convert';

class ConvertObjectUtils {

  static Map<String, dynamic> converterStringInJson(String? jsonString) {
    Map<String, dynamic> objectConverter = {};
    if (jsonString != null) {
      objectConverter = jsonDecode(jsonString);
    }

    return objectConverter;
  }
}