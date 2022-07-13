class LoginReqModel {
  String? countryCode;
  String? pNumber;
  String? password;

  LoginReqModel({this.pNumber, this.countryCode, this.password});

  Map<String, dynamic> toJson() {
    return {
      'country_code': countryCode!.substring(1),
      'phone_number': pNumber,
      'password': password
    };
  }
}
