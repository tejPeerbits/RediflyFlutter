class APIEndpoints {
  APIEndpoints._();

  static String appEnvironment(String id) =>
      "organisation/getappenvironment?id=$id";

  static String login = "/user/login";

  static String confirmToken(String otp, String token, bool smsOk) =>
      "/user/confirmtoken?otp=$otp&smsOk=$smsOk&token=$token";

  static String getAirCraftList(String id) =>
      "/aircraft/getaircrafts?search=$id";

  static String getAirCraftByID(String id, String lastUpdatedTime) =>
      "/aircraft/getaircraft?id=$id";

  static String getFacet(String id, String lastUpdatedTime) =>
      "/facet/getfacet?id=$id&lastUpdated=$lastUpdatedTime";

  static String get syncOrganisation => "/organisation/syncOrganisation";
}
