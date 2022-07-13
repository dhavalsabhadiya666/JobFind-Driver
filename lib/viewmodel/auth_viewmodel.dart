import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telescope_driver/model/apiModel/requestModel/login_req_model.dart';
import 'package:telescope_driver/model/apiModel/requestModel/register_req_model.dart';
import 'package:telescope_driver/model/apis/api_response.dart';
import 'package:telescope_driver/model/repo/check_otp_repo.dart';
import 'package:telescope_driver/model/repo/login_repo.dart';
import 'package:telescope_driver/model/repo/register_repo.dart';
import 'package:telescope_driver/model/repo/resend_otp_repo.dart';
import 'package:telescope_driver/model/repo/set_password_repo.dart';
import 'package:telescope_driver/utils/const_utils.dart';
import 'package:telescope_driver/utils/enum_utils.dart';

class AuthViewModel extends GetxController {
  String _profilePic = "";
  String _addressProf = "";
  String _licenseFrontImg = "";
  String _licenseBackImg = "";
  String _licensePlate = "";
  String _insurance = "";
  String _vehiclePhoto = "";

  Image imgOfCardType = Image.asset('assets/images/icon/CVV.png');

  /// GETTER
  String get profilePic => _profilePic;
  String get vehiclePhoto => _vehiclePhoto;

  String get insurance => _insurance;

  String get addressProf => _addressProf;

  String get licenseBackImg => _licenseBackImg;

  String get licenseFrontImg => _licenseFrontImg;
  String get licensePlate => _licensePlate;

  getCardImageAccordingToCardType(cardNumber) {
    imgOfCardType =
        ConstUtils.kGetCardTypeFrmNumber(cardNumber) == CardType.Visa
            ? Image.asset('assets/images/icon/visa.png')
            : ConstUtils.kGetCardTypeFrmNumber(cardNumber) == CardType.Master
                ? Image.asset('assets/images/icon/mastercard.png')
                : ConstUtils.kGetCardTypeFrmNumber(cardNumber) ==
                        CardType.AmericanExpress
                    ? Image.asset('assets/images/icon/amex.png')
                    : ConstUtils.kGetCardTypeFrmNumber(cardNumber) ==
                            CardType.Discover
                        ? Image.asset('assets/images/icon/discover.png')
                        : Image.asset('assets/images/icon/CVV.png');
    update();
  }

  /// CLEAT DATA

  void clearData() {
    _profilePic = '';
    _addressProf = '';
    _licenseFrontImg = '';
    _licenseBackImg = '';
    _insurance = '';
    _licensePlate = "";
    _vehiclePhoto = "";
    registerApiResponse = ApiResponse.initial(Status.INITIAL.name);
  }

  /// SETTER

  set insurance(String value) {
    _insurance = value;
    update();
  }

  set licenseBackImg(String value) {
    _licenseBackImg = value;
    update();
  }

  set licenseFrontImg(String value) {
    _licenseFrontImg = value;
    update();
  }

  set addressProf(String value) {
    _addressProf = value;
    update();
  }

  set profilePic(String value) {
    _profilePic = value;
    update();
  }

  set licensePlate(String value) {
    _licensePlate = value;
    update();
  }

  set vehiclePhoto(String value) {
    _vehiclePhoto = value;
    update();
  }

  void setLoading() {
    registerApiResponse = ApiResponse.loading(Status.LOADING.name);
    update();
  }

  void setError() {
    registerApiResponse = ApiResponse.error(Status.ERROR.name);
    update();
  }

  void resendOtpInit() {
    resendOtpApiResponse = ApiResponse.error(Status.INITIAL.name);
    // update();
  }

  void checkOtpInit() {
    checkOtpApiResponse = ApiResponse.error(Status.INITIAL.name);
    // update();
  }

  void setPassInit() {
    setPasswordApiResponse = ApiResponse.initial(Status.INITIAL.name);
    // update();
  }

  /// API CALL STARTING ................................................................///

  ApiResponse loginApiResponse = ApiResponse.initial(Status.INITIAL.name);
  ApiResponse registerApiResponse = ApiResponse.initial(Status.INITIAL.name);
  ApiResponse resendOtpApiResponse = ApiResponse.initial(Status.INITIAL.name);
  ApiResponse checkOtpApiResponse = ApiResponse.initial(Status.INITIAL.name);
  ApiResponse setPasswordApiResponse = ApiResponse.initial(Status.INITIAL.name);

  /// LOGIN
  Future<void> login(LoginReqModel reqModel) async {
    loginApiResponse = ApiResponse.loading(Status.LOADING.name);
    update();
    try {
      final response = await LoginRepo().loginRepo(reqModel);
      loginApiResponse = ApiResponse.complete(response);
    } catch (e) {
      loginApiResponse = ApiResponse.error(Status.ERROR.name);
      print('LOGIN ERROR :=> $e');
    }
    update();
  }

  /// REGISTER
  Future<void> register(RegisterReqModel reqModel) async {
    // registerApiResponse = ApiResponse.loading(Status.LOADING.name);
    // update();
    try {
      final response = await RegisterRepo().registerRepo(reqModel);
      registerApiResponse = ApiResponse.complete(response);
    } catch (e) {
      registerApiResponse = ApiResponse.error(Status.ERROR.name);
      print('REGISTER ERROR :=> $e');
    }
    update();
  }

  /// RESEND OTP
  Future<void> resendOtp() async {
    resendOtpApiResponse = ApiResponse.loading(Status.LOADING.name);
    update();
    try {
      final response = await ResendOtpRepo().resendOtpRepo();
      resendOtpApiResponse = ApiResponse.complete(response);
    } catch (e) {
      resendOtpApiResponse = ApiResponse.error(Status.ERROR.name);
      print('RESEND OTP ERROR :=> $e');
    }
    update();
  }

  /// CHECK OTP
  Future<void> checkOtp({required String otp}) async {
    checkOtpApiResponse = ApiResponse.loading(Status.LOADING.name);
    update();
    try {
      final response = await CheckOtpRepo().checkOtpRepo(otp: otp);
      checkOtpApiResponse = ApiResponse.complete(response);
    } catch (e) {
      checkOtpApiResponse = ApiResponse.error(Status.ERROR.name);
      print('CHECK OTP ERROR :=> $e');
    }
    update();
  }

  /// SET PASSWORD
  Future<void> setPassword({required String pass}) async {
    setPasswordApiResponse = ApiResponse.loading(Status.LOADING.name);
    update();
    try {
      final response = await SetPasswordRepo().setPasswordRepo(pass: pass);
      setPasswordApiResponse = ApiResponse.complete(response);
    } catch (e) {
      setPasswordApiResponse = ApiResponse.error(Status.ERROR.name);
      print('CHECK OTP ERROR :=> $e');
    }
    update();
  }
}
