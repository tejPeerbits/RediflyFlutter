import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redifly_flutter/network/api.dart';
import 'package:redifly_flutter/network/api_endpoints.dart';
import 'package:redifly_flutter/network/dio_factory.dart';
import 'package:redifly_flutter/network/model/confirm_token_response_model.dart';
import 'package:redifly_flutter/network/model/login_model.dart';
import 'package:redifly_flutter/network/model/login_response_model.dart';

import '../src/dashboard/views/dashboard_screen.dart';

class Repository {
  Repository._();

  static environment(BuildContext context, LoginModel loginModel) async {
    Api.request(
      method: HttpMethod.post,
      path: APIEndpoints.appEnvironment("C860081A-CE40-417F-A002-8F61CF58C605"),
      params: {},
      context: context,
      onResponse: (response) {
        print("response $response");
      },
    );
  }

  static login(BuildContext context, LoginModel loginModel) async {
    Api.request(
      method: HttpMethod.post,
      path: APIEndpoints.login,
      params: loginModel.toJson(),
      context: context,
      onResponse: (response) {
        var loginResponse = LoginResponseModel.fromJson(response);
        DioFactory.initialiseHeaders(loginResponse.token ?? "");
        // confirmToken(context, loginResponse);
        print("response $response");
      },
    );
  }

  static confirmToken(
    BuildContext context,
    LoginResponseModel loginResponseModel,
  ) {
    Api.request(
      method: HttpMethod.post,
      path: APIEndpoints.confirmToken(loginResponseModel.otp.toString(),
          loginResponseModel.token ?? "", loginResponseModel.smsOk ?? false),
      params: loginResponseModel.toJson(),
      context: context,
      onResponse: (response) {
        var confirmTokenModel = ConfirmTokenResponseModel.fromJson(response);
        DioFactory.initialiseHeaders(confirmTokenModel.token ?? "");
        // syncOrganization(context, confirmTokenModel);
        // getAirCraftList(context, confirmTokenModel);
        // getFacet(context, "7caae94c-5686-4a8e-abf2-04bd3b2acea5");
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const DashBoardScreen(),
        //   ),
        // );
      },
    );
  }

  static getAirCraftList(
    BuildContext context,
    ConfirmTokenResponseModel confirmTokenResponseModel,
  ) {
    Api.request(
      method: HttpMethod.get,
      path: APIEndpoints.getAirCraftList(confirmTokenResponseModel.id ?? ""),
      params: {},
      context: context,
      onResponse: (response) {
        print("get aircraft response $response");
        // getFacet(context, "7caae94c-5686-4a8e-abf2-04bd3b2acea5");
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const DashBoardScreen(),
        //   ),
        // );
      },
    );
  }

  static getFacet(BuildContext context, String id) {
    Api.request(
      method: HttpMethod.get,
      path: APIEndpoints.getFacet(
        id,
        "1/1/1924%2010:35:26%20AM",
      ),
      params: {},
      context: context,
      onResponse: (response) {
        log("getFacet ${jsonDecode(response)}");
        // syncOrganization(context, confirmTokenModel);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashBoardScreen(),
          ),
        );
      },
    );
  }

// static syncOrganization(
//   BuildContext context,
//   ConfirmTokenResponseModel confirmTokenResponseModel,
// ) {
//   Api.request(
//     method: HttpMethod.put,
//     path: APIEndpoints.syncOrganisation,
//     params: {
//       "LastUpdateDevice": "2023-11-30T09:14:01.934711Z",
//       "LastUpdateGround": "2000-01-01T00:00:00",
//       "Id": confirmTokenResponseModel.id,
//       "OrganisationId": confirmTokenResponseModel.organisationId,
//       "Created": "2023-11-30T09:14:01.934611Z",
//       "Updated": "1923-11-30T09:14:01.934634Z"
//     },
//     context: context,
//     onResponse: (response) {
//       // var organizationResponse = AppModel.fromJson(response);
//       // if (organizationResponse.template != null) {
//       //   print("template in repo ${organizationResponse.template?.organisationId}");
//       //   SharedPrefHelper.saveTemplate(organizationResponse.template!);
//       // }
//       // Navigator.pushReplacement(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) =>
//       //         DashBoardScreen(appModel: organizationResponse),
//       //   ),
//       // );
//     },
//   );
// }
}
