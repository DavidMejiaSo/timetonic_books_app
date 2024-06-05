import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  /// Loads the environment variables from the `.env` file.
  /// This method should be called during the app initialization to ensure
  /// all required environment variables are loaded and available for use.
  static initEnvironment() async {
    await dotenv.load(fileName: ".env");
  }

  static String apiUrl = dotenv.env['API_URL'] ?? 'API_URL not configured';
  static String url = dotenv.env['URL'] ?? 'URL not configured';
  static String apiReqAppKey =
      dotenv.env['API_REQ_APP_KEY'] ?? 'API_REQ_APP_KEY not configured';
  static String apiReqOAuth =
      dotenv.env['API_REQ_OAUTH'] ?? 'API_REQ_OAUTH not configured';
  static String apiReqSessKey =
      dotenv.env['API_REQ_SESS_KEY'] ?? 'API_REQ_SESS_KEY not configured';
  static String apiReqGetBooks =
      dotenv.env['API_REQ_GET_BOOKS'] ?? 'API_REQ_GET_BOOKS not configured';
  static String apiVersion =
      dotenv.env['API_VERSION'] ?? 'API_VERSION not configured';
}
