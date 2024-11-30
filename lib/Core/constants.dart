import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  Constants._();

  static String get bitlyAccess => dotenv.env['BITLY_ACCESS'] ?? '';
  static String get apiUrl => dotenv.env['API_URL'] ?? '';
}
