import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:edu_flutter_app/domain/requests/api_config/nasa_api_config.dart';

abstract class NasaRequest {
  static Future<Map<String, dynamic>> getNextPageNasaPhotos(int page) async {
    var parameters = {
      'sol': NasaApiConfig.sol,
      'api_key': NasaApiConfig.apiKey,
      'page': '$page'
    };

    var url = Uri(
      scheme: NasaApiConfig.scheme,
      host: NasaApiConfig.host,
      path: NasaApiConfig.path,
      queryParameters: parameters
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }
}
