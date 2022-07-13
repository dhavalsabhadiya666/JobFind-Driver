import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/common/show_toast.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/pref_manager_utils.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/image_utils.dart';
import '../../utils/variable_utils.dart';
import '../../widgets/custombutton.dart';
import '../signup/SignupScreen.dart';

class CameraPermission extends StatefulWidget {
  const CameraPermission({Key? key}) : super(key: key);

  @override
  State<CameraPermission> createState() => _CameraPermissionState();
}

class _CameraPermissionState extends State<CameraPermission> {
  Future<void> _requestCameraPermission() async {
    print('CAMERA STATUS :${await Permission.camera.status}');
    if (await Permission.camera.request().isGranted ||
        await Permission.camera.request().isGranted) {
      await PrefManagerUtils.setPermissionStatus(true);
      Get.offAll(Signup());
    } else if (await Permission.camera.status.isDenied) {
      showToast(title: 'Enable camera permission from app setting');
      // showToast(title: 'Enable Location');
      // final status = await Permission.location.request();
      // print('LOCATION STATUS :$status');

      // _requestLocationPermission();
    }
    // else if (await Permission.location.status.isPermanentlyDenied) {
    //   showToast(title: 'Enable camera permission from app setting');
    //
    //   // _requestLocationPermission();
    // }
    else {
      openAppSettings().then((_) => _requestCameraPermission());
    }

    // // When Location permission is granted
    // if (locationPermission == PermissionStatus.granted) {
    //   // When Location permission is denied
    // } else if (locationPermission == PermissionStatus.denied) {
    //   if (requestCount == 1) {
    //     _requestionLocationPermission();
    //     requestCount++;
    //   }

    //   // When Location permission is permanentlyDenied
    // } else if (locationPermission == PermissionStatus.permanentlyDenied) {
    //   if (requestCount == 1) {
    //     openAppSettings().then((_) => _requestionLocationPermission());
    //     requestCount++;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            ImageUtils.backIcon,
                            height: 5.w,
                          ),
                        ),
                      ),
                      LinearPercentIndicator(
                        padding: EdgeInsets.only(left: 8.w, right: 8.w),
                        width: 80.w,
                        lineHeight: 1.w,
                        percent: 1,
                        progressColor: ColorUtils.primaryColor,
                        barRadius: const Radius.circular(16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 85.w,
                  ),
                  Center(
                    child: Text(
                      VariableUtils.cameraText,
                      style: FontTextStyle.GorditaW7S18darkBlack,
                    ),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Center(
                    child: Text(
                      VariableUtils.cameraSubText,
                      style: FontTextStyle.GorditaW5S12lightBlack,
                    ),
                  ),
                  SizedBox(
                    height: 15.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: CustomButton(
                      width: 100.w,
                      onPressed: () {
                        _requestCameraPermission();
                      },
                      title: 'Allow Camera ',
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () async {
                        await PrefManagerUtils.setPermissionStatus(true);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text(
                        'Maybe later',
                        style: FontTextStyle.GorditaW5S12darkBlack.copyWith(
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
