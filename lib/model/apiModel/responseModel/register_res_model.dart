class RegisterResModel {
  RegisterResModel({
    this.sucecess,
    this.data,
    this.message,
  });

  RegisterResModel.fromJson(dynamic json) {
    sucecess = json['sucecess'];
    data = json['sucecess'] == false
        ? UserData()
        : json['data'] != null
            ? UserData.fromJson(json['data'])
            : null;
    message = json['message'] == "" ? null : json['message'];
  }

  bool? sucecess;
  UserData? data;
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

class UserData {
  UserData({
    this.firstName,
    this.lastName,
    this.countryCode,
    this.phoneNumber,
    this.email,
    this.otp,
    this.image,
    this.housePloatNo,
    this.city,
    this.state,
    this.zipCode,
    this.addressProof,
    this.licenseNo,
    this.licenseImageFront,
    this.licenseImageBack,
    this.cardNo,
    this.expDate,
    this.securityCode,
    this.insuranceDoc,
    this.vehicleType,
    this.nameOfVehicle,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  UserData.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    otp = json['otp'].toString();
    image = json['image'];
    housePloatNo = json['house_ploat_no'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    addressProof = json['address_proof'];
    licenseNo = json['license_no'];
    licenseImageFront = json['license_image_front'];
    licenseImageBack = json['license_image_back'];
    cardNo = json['card_no'];
    expDate = json['exp_date'];
    securityCode = json['security_code'];
    insuranceDoc = json['insurance_doc'];
    vehicleType = json['vehicle_type'];
    nameOfVehicle = json['name_of_vehicle'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  String? firstName;
  String? lastName;
  String? countryCode;
  String? phoneNumber;
  String? email;
  String? otp;
  String? image;
  String? housePloatNo;
  String? city;
  String? state;
  String? zipCode;
  String? addressProof;
  String? licenseNo;
  String? licenseImageFront;
  String? licenseImageBack;
  String? cardNo;
  String? expDate;
  String? securityCode;
  String? insuranceDoc;
  String? vehicleType;
  String? nameOfVehicle;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['country_code'] = countryCode;
    map['phone_number'] = phoneNumber;
    map['email'] = email;
    map['otp'] = otp;
    map['image'] = image;
    map['house_ploat_no'] = housePloatNo;
    map['city'] = city;
    map['state'] = state;
    map['zip_code'] = zipCode;
    map['address_proof'] = addressProof;
    map['license_no'] = licenseNo;
    map['license_image_front'] = licenseImageFront;
    map['license_image_back'] = licenseImageBack;
    map['card_no'] = cardNo;
    map['exp_date'] = expDate;
    map['security_code'] = securityCode;
    map['insurance_doc'] = insuranceDoc;
    map['vehicle_type'] = vehicleType;
    map['name_of_vehicle'] = nameOfVehicle;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['id'] = id;
    return map;
  }
}
