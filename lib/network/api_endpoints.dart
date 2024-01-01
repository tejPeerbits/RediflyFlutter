class APIEndpoints {
  APIEndpoints._();

  static String login = "/user/login";

  static String confirmToken(String otp, String token, bool smsOk) =>
      "/user/confirmtoken?otp=$otp&smsOk=$smsOk&token=$token";

  static String get syncOrganisation => "/organisation/syncOrganisation";
}
