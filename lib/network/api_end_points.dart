class ApiEndPoints {
  ApiEndPoints._();

  //Authentication
  static const String getToken = "admin/auth/getToken";
  static const String signInEndPoint = "v1/auth/login";
  static const String signUpEndPoint = "v1/auth/register";
  static const String mobileOTPEndPoint = "v1/auth/verify-mobile-otp";
  static const String emailOTPEndPoint = "v1/auth/verify-email-otp";
  static const String forgotPasswordEndPoint = "admin/auth/forgotPassword";
  static const String changePasswordEndPoint = "admin/auth/changePassword";
  static const String resendMobileOTP = "v1/auth/resendMobileOTP";
  static const String resendEmailOTP = "v1/auth/resendEmailOTP";
  static const String logoutEndPoint = "admin/auth/logout";

  static String editProfileEndPoint = "v1/auth/editProfile";
  static const String contactUsEndPoint = "v1/common/contactUs";
  static const String cms = "v1/common/cms";

  static const String faq = "v1/common/faq";

  static const String splashImage = "v1/auth/splashImage";

  static String editRelay(id) => "admin/device_relay/edit/$id";

  static String deleteAccount(id) => "admin/user_master/delete/$id";

  //Device

  static String getRelayEndPoint = "admin/device_relay/view";

  static String getDataTab() => "admin/device_relay/view";

  //User
  static String getUserEndPoint(id) => "admin/user_master/view/$id";

  //Device Settings
  static String getDeviceProjectDetails(id) =>
      "admin/device_project_detail/view/$id";

  static String getUnitDetails(id) => "admin/device_unit_detail/view/$id";

  static String getDeviceSubscription(id) =>
      "admin/device_subscription/view/$id";

  static const String addDeviceProjectDetails =
      "admin/device_project_detail/add";

  static const String addUnitDetails = "admin/device_unit_detail/add";

  static const String getRelayApi = "admin/device_relay/view";

  static const String addRelayApi = "admin/device_relay/add";
  static const String addTemperatureAndPressureApi = "admin/device_sensor/add";
  static const String addDeviceMaster = "admin/device_master/add";
  static const String editAccessApi = "admin/device_user/add";

  //Device Details
  static String getDeviceDetails(id) => "admin/device_master/view/$id";
  static const String getGraphData = "admin/device_report/report";

  //Home Master
  static String getHomeDetailsApi = "admin/user_master/homeDetails";

  //Device Data
  static String getDeviceData(
      {String? startDate, String? endDate, int index = 0}) {
    return "admin/device_report/report?device_id=BC_device_0001&start_date=${startDate ?? DateTime.now().toUtc().second}&end_date=${endDate ?? DateTime.now().toUtc().second}&data_type=${index + 1}";
  }

  //Notification
  static String getNotification = "admin/notifications/getNotification?page=1";
}
