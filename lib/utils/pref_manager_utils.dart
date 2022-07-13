import 'package:get_storage/get_storage.dart';

class PrefManagerUtils {
  static GetStorage getStorage = GetStorage();
  static String onBoarding = 'ON_BOARDING';
  static String onPermission = 'ON_PERMISSION';
  static String userData = 'USER_DATA';
  static String loginStatus = 'LOGIN_STATUS';
  static String registerStatus = 'REG_STATUS';
  static String profileSetupStatus = 'PROFILE_SETUP_STATUS';

  /// ON BOARDING
  static Future<void> setOnBoardingStatus(bool value) async {
    await getStorage.write(onBoarding, value);
  }

  static bool getOnBoardingStatus() {
    return getStorage.read(onBoarding) ?? false;
  }

  /// ON PERMISSION
  static Future<void> setPermissionStatus(bool value) async {
    await getStorage.write(onPermission, value);
  }

  static bool getOnPermissionStatus() {
    return getStorage.read(onPermission) ?? false;
  }

  /// USER DATA
  static Future<void> setUserData(String value) async {
    await getStorage.write(userData, value);
  }

  static String getUserData() {
    return getStorage.read(userData) ?? '';
  }

  /// USER REGISTER STATUS
  static Future<void> setUserRegisterStatus(bool value) async {
    await getStorage.write(registerStatus, value);
  }

  static bool getUserRegisterStatus() {
    return getStorage.read(registerStatus) ?? false;
  }

  /// USER LOGIN STATUS
  static Future<void> setUserLoginStatus(bool value) async {
    await getStorage.write(loginStatus, value);
  }

  static bool getUserLoginStatus() {
    return getStorage.read(loginStatus) ?? false;
  }

  /// USER PROFILE SETUP STATUS
  static Future<void> setProfileSetupStatus(bool value) async {
    await getStorage.write(profileSetupStatus, value);
  }

  static bool getProfileSetupStatus() {
    return getStorage.read(profileSetupStatus) ?? false;
  }
}
