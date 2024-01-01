// import 'dart:developer';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sms_redifly_flutter/common/database/database_helper.dart';
// import 'package:sms_redifly_flutter/common/model/app_model.dart';
// import 'package:sms_redifly_flutter/common/shared_pref/shared_pref_helper.dart';
// import 'package:sms_redifly_flutter/network/api.dart';
// import 'package:sms_redifly_flutter/network/api_endpoints.dart';
// import 'package:sms_redifly_flutter/network/dio_factory.dart';
// import 'package:sms_redifly_flutter/network/model/Login_model.dart';
// import 'package:sms_redifly_flutter/network/model/confirm_token_response_model.dart';
// import 'package:sms_redifly_flutter/network/model/login_response_model.dart';
// import 'package:sqflite/sqflite.dart';
//
// import '../src/dashboard/views/dashboard_screen.dart';
//
// class Repository {
//   Repository._();
//
//   static login(BuildContext context, LoginModel loginModel) async {
//     Api.request(
//       method: HttpMethod.post,
//       path: APIEndpoints.login,
//       params: loginModel.toJson(),
//       context: context,
//       onResponse: (response) {
//         var loginResponse = LoginResponseModel.fromJson(response);
//         DioFactory.initialiseHeaders(loginResponse.token ?? "");
//         confirmToken(context, loginResponse);
//         print("response $response");
//       },
//     );
//   }
//
//   static confirmToken(
//     BuildContext context,
//     LoginResponseModel loginResponseModel,
//   ) {
//     Api.request(
//       method: HttpMethod.post,
//       path: APIEndpoints.confirmToken(loginResponseModel.otp.toString(),
//           loginResponseModel.token ?? "", loginResponseModel.smsOk ?? false),
//       params: loginResponseModel.toJson(),
//       context: context,
//       onResponse: (response) {
//         var confirmTokenModel = ConfirmTokenResponseModel.fromJson(response);
//         DioFactory.initialiseHeaders(confirmTokenModel.token ?? "");
//         syncOrganization(context, confirmTokenModel);
//         // Navigator.pushReplacement(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => const DashBoardScreen(),
//         //   ),
//         // );
//       },
//     );
//   }
//
//   static syncOrganization(
//     BuildContext context,
//     ConfirmTokenResponseModel confirmTokenResponseModel,
//   ) {
//     Api.request(
//       method: HttpMethod.put,
//       path: APIEndpoints.syncOrganisation,
//       params: {
//         "LastUpdateDevice": "2023-11-30T09:14:01.934711Z",
//         "LastUpdateGround": "2000-01-01T00:00:00",
//         "Id": confirmTokenResponseModel.id,
//         "OrganisationId": confirmTokenResponseModel.organisationId,
//         "Created": "2023-11-30T09:14:01.934611Z",
//         "Updated": "1923-11-30T09:14:01.934634Z"
//       },
//       context: context,
//       onResponse: (response) {
//         var organizationResponse = AppModel.fromJson(response);
//         if (organizationResponse.template != null) {
//           print("template in repo ${organizationResponse.template?.organisationId}");
//           SharedPrefHelper.saveTemplate(organizationResponse.template!);
//         }
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 DashBoardScreen(appModel: organizationResponse),
//           ),
//         );
//       },
//     );
//   }
// }
