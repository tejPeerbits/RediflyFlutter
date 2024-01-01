import 'dio_factory.dart';

class Config {
  Config._();

  ///call in Main dart
  static init() {
    baseEnv = ApiEnvironment.Dev;
  }

  /// API Config
  static const Duration timeout = Duration(seconds: 60);
  static const logNetworkRequest = true;
  static const logNetworkRequestHeader = true;
  static const logNetworkRequestBody = true;
  static const logNetworkResponseHeader = false;
  static const logNetworkResponseBody = true;
  static const logNetworkError = true;

  static bool isLoggedIn = false;

  static bool displayOnResponse = true;
  static bool displayOnError = true;
  static bool displayOnRequest = true;

  static late ApiEnvironment baseEnv;
}

enum APILog { cURL, request }