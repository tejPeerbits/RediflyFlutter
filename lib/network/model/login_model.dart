class LoginModel {
  LoginModel({
    this.clientId,
    this.email,
    this.password,
    this.userInfo,
    this.accessToken,
  });

  LoginModel.fromJson(dynamic json) {
    clientId = json['ClientId'];
    email = json['Email'];
    password = json['Password'];
    userInfo = json['UserInfo'];
    accessToken = json['AccessToken'];
  }
  String? clientId;
  String? email;
  String? password;
  String? userInfo;
  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ClientId'] = clientId;
    map['Email'] = email;
    map['Password'] = password;
    map['UserInfo'] = userInfo;
    map['AccessToken'] = accessToken;
    return map;
  }
}
