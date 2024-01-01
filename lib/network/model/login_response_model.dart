class LoginResponseModel {
  LoginResponseModel({
    this.id,
    this.otp,
    this.smsOk,
    this.token,
    this.userRoles,
    this.organisationId,
    this.environmentModel,
  });

  LoginResponseModel.fromJson(dynamic json) {
    id = json['id'];
    otp = json['otp'];
    smsOk = json['smsOk'];
    token = json['token'];
    userRoles = json['userRoles'];
    organisationId = json['organisationId'];
    environmentModel = json['environmentModel'];
  }
  String? id;
  num? otp;
  bool? smsOk;
  String? token;
  String? userRoles;
  String? organisationId;
  dynamic environmentModel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['otp'] = otp;
    map['smsOk'] = smsOk;
    map['token'] = token;
    map['userRoles'] = userRoles;
    map['organisationId'] = organisationId;
    map['environmentModel'] = environmentModel;
    return map;
  }
}
