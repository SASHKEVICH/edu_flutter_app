import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class NasaApiConfig {
  static const scheme = 'https';
  static const host = '';
  static const path = '';
  static const sol = '100';
  static String? apiKey = dotenv.env["APIKEY"];
}
