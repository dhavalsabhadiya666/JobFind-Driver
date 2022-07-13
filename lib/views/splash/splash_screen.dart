import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:telescope_driver/utils/image_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/pref_manager_utils.dart';
import 'package:telescope_driver/views/allowPermissions/location_permission.dart';
import 'package:telescope_driver/views/login/Login_screen.dart';
import 'package:telescope_driver/views/onboarding/on_boarding_screen.dart';
import 'package:telescope_driver/views/signup/Genratepassword_screen.dart';

import '../../utils/font_style_utils.dart';
import '../../utils/variable_utils.dart';
import '../home/newBottomBar.dart';
import '../signup/SignupScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await Future.delayed(Duration(seconds: 3));
    // final onBoardingStatus = PrefManagerUtils.getOnBoardingStatus();
    final onPermissionStatus = PrefManagerUtils.getOnPermissionStatus();
    final userRegisterStatus = PrefManagerUtils.getUserRegisterStatus();
    final userLoggedInStatus = PrefManagerUtils.getUserLoginStatus();
    final userProfileSetupStatus = PrefManagerUtils.getProfileSetupStatus();
    // if (!onBoardingStatus) {
    //   Get.offAll(OnBoardingScreen());
    // }
    if (!onPermissionStatus) {
      Get.offAll(LocationPermission());
    } else if (!userRegisterStatus) {
      Get.offAll(Signup());
    } else if (!userProfileSetupStatus) {
      Get.offAll(GeneratePass());
    } else if (!userLoggedInStatus) {
      Get.offAll(Loginscreen());
    } else {
      Get.offAll(NewBottomNavBar());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Scaffold(
          body: Container(
        child: Stack(
          children: [
            Image.asset(
              ImageUtils.splashForthImage,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ImageUtils.locationIcon,
                        height: 10.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        VariableUtils.title,
                        style: FontTextStyle.gilroyW7S24darkBlack
                            .copyWith(fontSize: 28.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Image.asset(
                    ImageUtils.splashSixthImage,
                    height: 7.w,
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
