class RegisterReqModel {
  String? image;
  String? fstName;
  String? lstName;
  String? email;
  String? countryCode;
  String? pNumber;
  String? housePlot;
  String? city;
  String? state;
  String? zipCode;
  String? addressProf;
  String? licenseNo;
  String? licenseFrontImg;
  String? licenseBackImg;
  String? cardNo;
  String? expDate;
  String? securityCode;
  String? insuranceDoc;
  String? vehicleType;
  String? nameOfVehicle;

  RegisterReqModel(
      {this.image,
      this.fstName,
      this.lstName,
      this.email,
      this.countryCode,
      this.pNumber,
      this.housePlot,
      this.city,
      this.state,
      this.zipCode,
      this.addressProf,
      this.licenseNo,
      this.licenseFrontImg,
      this.licenseBackImg,
      this.cardNo,
      this.expDate,
      this.securityCode,
      this.insuranceDoc,
      this.vehicleType,
      this.nameOfVehicle});

  Map<String, dynamic> toJson() => {
        "image": image,
        "first_name": fstName,
        "last_name": lstName,
        "email": email,
        "country_code": countryCode,
        "phone_number": pNumber,
        "house_ploat_no": housePlot,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "address_proof": addressProf,
        "license_no": licenseNo,
        "license_image_front": licenseFrontImg,
        "license_image_back": licenseFrontImg,
        "card_no": cardNo,
        "exp_date": expDate,
        "security_code": securityCode,
        "insurance_doc": insuranceDoc,
        "vehicle_type": vehicleType,
        "name_of_vehicle": nameOfVehicle ?? "",
      };
}
