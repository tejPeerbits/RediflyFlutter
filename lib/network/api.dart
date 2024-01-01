import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import '../common/dialogs.dart';
import 'base_response.dart';
import 'dio_factory.dart';

enum HttpMethod { delete, get, patch, post, put }

extension HttpMethods on HttpMethod {
  String? get value {
    switch (this) {
      case HttpMethod.delete:
        return 'DELETE';
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.patch:
        return 'PATCH';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      default:
        return null;
    }
  }
}

class Api {
  //General Post Request
  static Future<void> request({
    required HttpMethod? method,
    bool hideLoadingIndicator = false,
    required String? path,
    required Map? params,
    required BuildContext context,
    required OnResponse onResponse,
  }) async {
    try {
      if (!hideLoadingIndicator) {
        showLoading(context);
      }
      dio.Response response;
      switch (method) {
        case HttpMethod.post:
          response = await DioFactory.dio()!.post(
            path!,
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.acceptHeader: "application/json",
            }),
            data: params,
          );
          break;
        case HttpMethod.delete:
          response = await DioFactory.dio()!.delete(
            path!,
            data: params,
          );
          break;
        case HttpMethod.get:
          response = await DioFactory.dio()!.get(
            path!,
          );
          break;
        case HttpMethod.patch:
          response = await DioFactory.dio()!.patch(
            path!,
            data: params,
          );
          break;
        case HttpMethod.put:
          response = await DioFactory.dio()!.put(
            path!,
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }),
            data: params,
          );
          break;
        default:
          return;
      }
      log("response of api   >>>>>>  ");

      if (!hideLoadingIndicator) {
        hideLoading(context);
      }

      if (response.statusCode == 401) {
        // showSessionDialog();
        print("401 aivi");
      } else {
        onResponse(response.data);
      }
    } catch (e) {
      if (!hideLoadingIndicator) {
        hideLoading(context);
      }

      String errorMessage = "";
      if (e is DioError) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          log("statuscode -->> ${e.response}");
          errorMessage = 'Server unreachable';
        } else if (e.type == DioExceptionType.badResponse) {
          if (e.response!.statusCode == 401) {
          } else {
            // final response = e.response;
            // List errors = response?.data['error'];
            // if (errors.isNotEmpty) {
            //   errorMessage = errors.first;
            // } else {
            //   errorMessage = "Something went wrong! Please `try again.";
            // }
          }
        } else {
          errorMessage = "Request cancelled";
        }
      } else {
        errorMessage = e.toString();
      }

      // handleApiError(errorMessage);
    }
  }
}
