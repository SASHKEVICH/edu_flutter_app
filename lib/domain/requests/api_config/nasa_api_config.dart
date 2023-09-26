import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class NasaApiConfig {
  static const scheme = 'https';
  static const host = 'api.nasa.gov';
  static const path = 'mars-photos/api/v1/rovers/spirit/photos';
  static const sol = '100';
  static String? apiKey = dotenv.env["APIKEY"];
}
