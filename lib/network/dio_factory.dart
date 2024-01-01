import 'dart:developer' show log;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'config.dart';

enum ApiEnvironment { UAT, Dev, Prod }

extension APIEnvi on ApiEnvironment {
  String? endpoint() {
    switch (this) {
      case ApiEnvironment.UAT:
        return "https://sms.REDiFly.com/api";
      case ApiEnvironment.Dev:
        return "https://sms.REDiFly.com/api";
      case ApiEnvironment.Prod:
        return "https://sms.REDiFly.com/api";
      default:
        return null;
    }
  }
}

typedef OnError = void Function(String error, Map<String, dynamic> data);
typedef OnResponse = void Function(dynamic response);

class DioFactory {
  static _singleton() => DioFactory._instance();

  static Dio? dio() => _singleton()._dio;
  static var _deviceName = 'Generic Device';
  static var _authorization = '';

  // static Future<bool> computeDeviceInfo() async {
  //   if (Platform.isAndroid || Platform.isIOS) {
  //     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //     if (Platform.isAndroid) {
  //       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //       _deviceName = '${androidInfo.brand} ${androidInfo.model}';
  //       log("android Info -> $androidInfo");
  //     } else {
  //       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //       _deviceName = iosInfo.utsname.machine!;
  //     }
  //   } else if (Platform.isFuchsia) {
  //     _deviceName = 'Generic Fuchsia Device';
  //   } else if (Platform.isLinux) {
  //     _deviceName = 'Generic Linux Device';
  //   } else if (Platform.isMacOS) {
  //     _deviceName = 'Generic Macintosh Device';
  //   } else if (Platform.isWindows) {
  //     _deviceName = 'Generic Windows Device';
  //   }
  //
  //   return true;
  // }

  static void initialiseHeaders(String token) {
    _authorization = token;
    // dio()!.options.headers[HttpHeaders.authorizationHeader] = _authorization;
  }

  static void initFCMToken(String token) {
    var _token = token;
    dio()!.options.headers["device_id"] = _token;
  }

  Dio? _dio;

  DioFactory._instance() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEnvironment.Prod.endpoint()!,
        headers: {
          HttpHeaders.userAgentHeader: _deviceName,
          // HttpHeaders.authorizationHeader: _authorization,
          "token": _authorization
          // "device_id": Config.FCM_TOKEN,
          // "device_type": Platform.isIOS ? "I" : "A",
          // "language": Get.deviceLocale!.languageCode
        },
        connectTimeout: Config.timeout,
        receiveTimeout: Config.timeout,
        sendTimeout: Config.timeout,
        contentType: Headers.formUrlEncodedContentType,
      ),
    );
    if (!kReleaseMode) {
      _dio!.interceptors.add(LogInterceptor(
        request: Config.logNetworkRequest,
        requestHeader: Config.logNetworkRequestHeader,
        requestBody: Config.logNetworkRequestBody,
        responseHeader: Config.logNetworkResponseHeader,
        responseBody: Config.logNetworkResponseBody,
        error: Config.logNetworkError,
        logPrint: (Object object) {
          log(object.toString(), name: 'dio');
        },
      ));
    }
  }
}
