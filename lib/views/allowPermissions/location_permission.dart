import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/common/show_toast.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/pref_manager_utils.dart';
import 'package:telescope_driver/views/signup/SignupScreen.dart';
import 'package:telescope_driver/widgets/custombutton.dart';

class LocationPermission extends StatefulWidget {
  const LocationPermission({Key? key}) : super(key: key);

  @override
  State<LocationPermission> createState() => _LocationPermissionState();
}

class _LocationPermissionState extends State<LocationPermission> {
  bool mapLocationPermission = false,
      notiPermission = false,
      cameraPermission = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                'Allow access',
                style: FontTextStyle.GorditaW7S18darkBlack,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Ensure a seamless delivery experience by allowing" to "Ensure a seamless delivery experience!',
                style: FontTextStyle.GorditaW5S12lightBlack,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'By allowing the following permissions, You\'ll receive.',
                style: FontTextStyle.GorditaW7S12darkBlack,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                'Location - Track your deliveries (Recommended)',
                style: FontTextStyle.GorditaW5S10darkBlack,
              ),
              leading: Image.asset(
                ImageUtils.mapImg,
                scale: 11,
              ),
              trailing: InkWell(
                  borderRadius: BorderRadius.circular(300),
                  onTap: () {
                    setState(() {
                      mapLocationPermission = !mapLocationPermission;
                    });
                  },
                  child: checkBox(mapLocationPermission)),
            ),
            ListTile(
              title: Text(
                'Notification - Stay informed each step of the way (Required)',
                style: FontTextStyle.GorditaW5S10darkBlack,
              ),
              leading: Image.asset(
                ImageUtils.notificationImg,
                scale: 11,
              ),
              trailing: InkWell(
                  borderRadius: BorderRadius.circular(300),
                  onTap: () {
                    setState(() {
                      notiPermission = !notiPermission;
                    });
                  },
                  child: checkBox(notiPermission)),
            ),
            ListTile(
              title: Text(
                'Camera - Take and upload pictures for your deliveries (Required)',
                style: FontTextStyle.GorditaW5S10darkBlack,
              ),
              leading: Image.asset(
                ImageUtils.cameraImg,
                scale: 11,
              ),
              trailing: InkWell(
                  borderRadius: BorderRadius.circular(300),
                  onTap: () {
                    setState(() {
                      cameraPermission = !cameraPermission;
                    });
                  },
                  child: checkBox(cameraPermission)),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                width: 100.w,
                onPressed: () {
                  onTap();
                },
                title: 'Allow Access',
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  await PrefManagerUtils.setPermissionStatus(true);
                  Get.offAll(Signup());
                },
                child: Text(
                  'Deny access',
                  style: FontTextStyle.GorditaW5S12darkBlack.copyWith(
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  void onTap() {
    if (!mapLocationPermission) {
      showToast(title: 'Select location permission');
      return;
    }
    _requestLocationPermission();
    // if (!notiPermission) {
    //   showToast(title: 'Select notification');
    //   return;
    // }
    // if (!cameraPermission) {
    //   showToast(title: 'Select camera');
    //   return;
    // }
    // _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    // print('LOCATION STATUS :${await Permission.location.status}');
    if (await Permission.location.request().isGranted ||
        await Permission.locationWhenInUse.request().isGranted) {
      if (!cameraPermission) {
        showToast(title: 'Select camera permission');
        return;
      }
      _requestCameraPermission();
    } else if (await Permission.location.status.isDenied) {
      showToast(title: 'Enable location from app setting');
      // showToast(title: 'Enable Location');
      //final status = await Permission.location.request();
      // print('LOCATION STATUS :$status');

      // _requestLocationPermission();
    } else if (await Permission.location.status.isPermanentlyDenied) {
      showToast(title: 'Enable location from app setting');

      // _requestLocationPermission();
    } else {
      openAppSettings().then((_) => _requestLocationPermission());
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

  Future<void> _requestCameraPermission() async {
    print('CAMERA STATUS :${await Permission.camera.status}');
    if (await Permission.camera.request().isGranted ||
        await Permission.camera.request().isGranted) {
      if (!notiPermission) {
        showToast(title: 'Select notification permission');
        return;
      }
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

  Container checkBox(bool checked) {
    return Container(
      height: 21,
      width: 21,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: !checked ? Colors.transparent : Color(0xffEAFDE6),
          border: Border.all(color: Color(0xffB3BDC4))),
      child: !checked
          ? SizedBox()
          : Center(
              child: Icon(Icons.check, size: 17, color: Color(0xffB3BDC4))),
    );
  }
}

/// ................................................

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:sizer/sizer.dart';
// import 'package:telescope_driver/common/show_toast.dart';
// import 'package:telescope_driver/utils/color_utils.dart';
// import 'package:telescope_driver/utils/image_utils.dart';
// import 'package:telescope_driver/utils/pref_manager_utils.dart';
// import 'package:telescope_driver/utils/variable_utils.dart';
// import '../../utils/font_style_utils.dart';
// import '../../widgets/custombutton.dart';
// import 'notification_permission.dart';
//
// class LocationPermission extends StatefulWidget {
//   const LocationPermission({Key? key}) : super(key: key);
//
//   @override
//   State<LocationPermission> createState() => _LocationPermissionState();
// }
//
// class _LocationPermissionState extends State<LocationPermission> {
//   Future<void> _requestLocationPermission() async {
//     print('LOCATION STATUS :${await Permission.location.status}');
//     if (await Permission.location.request().isGranted ||
//         await Permission.locationWhenInUse.request().isGranted) {
//       Get.off(Notificationpermission());
//     } else if (await Permission.location.status.isDenied) {
//       showToast(title: 'Enable location from app setting');
//       // showToast(title: 'Enable Location');
//       //final status = await Permission.location.request();
//       // print('LOCATION STATUS :$status');
//
//       // _requestLocationPermission();
//     } else if (await Permission.location.status.isPermanentlyDenied) {
//       showToast(title: 'Enable location from app setting');
//
//       // _requestLocationPermission();
//     } else {
//       openAppSettings().then((_) => _requestLocationPermission());
//     }
//
//     // // When Location permission is granted
//     // if (locationPermission == PermissionStatus.granted) {
//     //   // When Location permission is denied
//     // } else if (locationPermission == PermissionStatus.denied) {
//     //   if (requestCount == 1) {
//     //     _requestionLocationPermission();
//     //     requestCount++;
//     //   }
//
//     //   // When Location permission is permanentlyDenied
//     // } else if (locationPermission == PermissionStatus.permanentlyDenied) {
//     //   if (requestCount == 1) {
//     //     openAppSettings().then((_) => _requestionLocationPermission());
//     //     requestCount++;
//     //   }
//     // }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: ColorUtils.white,
//       child: SafeArea(
//         child: Scaffold(
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 2.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 15.w,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // Padding(
//                       //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       //   child: InkWell(
//                       //     onTap: () {
//                       //       Navigator.pop(context);
//                       //     },
//                       //     child: SvgPicture.asset(
//                       //       ImageUtils.backIcon,
//                       //       height: 5.w,
//                       //     ),
//                       //   ),
//                       // ),
//                       LinearPercentIndicator(
//                         padding: EdgeInsets.only(left: 8.w, right: 8.w),
//                         width: 80.w,
//                         lineHeight: 1.w,
//                         percent: 35 / 100,
//                         progressColor: ColorUtils.primaryColor,
//                         barRadius: const Radius.circular(16),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 90.w,
//                   ),
//                   Center(
//                     child: Text(
//                       VariableUtils.locationPermission,
//                       style: FontTextStyle.GorditaW7S18darkBlack,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5.w,
//                   ),
//                   Center(
//                     child: Text(
//                       VariableUtils.LocationSubText,
//                       style: FontTextStyle.GorditaW5S12lightBlack,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15.w,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(30.0),
//                     child: CustomButton(
//                       width: 100.w,
//                       onPressed: () {
//                         _requestLocationPermission();
//                       },
//                       title: 'Allow location services',
//                     ),
//                   ),
//                   Center(
//                     child: TextButton(
//                       onPressed: () {
//                         Get.offAll(Notificationpermission());
//                       },
//                       child: Text(
//                         'Maybe later',
//                         style: FontTextStyle.GorditaW5S12darkBlack.copyWith(
//                             decoration: TextDecoration.underline),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
