class OtpResendResModel {
  OtpResendResModel({
    this.sucecess,
    this.data,
    this.message,
  });

  OtpResendResModel.fromJson(dynamic json) {
    sucecess = json['sucecess'];
    data = json['sucecess'] == false
        ? Data()
        : json['data'] != null
            ? Data.fromJson(json['data'])
            : null;
    message = json['message'];
  }

  bool? sucecess;
  Data? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sucecess'] = sucecess;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.otp,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    otp = json['otp'];
  }

  String? id;
  int? otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['otp'] = otp;
    return map;
  }
}
