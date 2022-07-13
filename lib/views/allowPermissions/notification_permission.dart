import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';

import '../../utils/font_style_utils.dart';
import '../../utils/image_utils.dart';
import '../../utils/variable_utils.dart';
import '../../widgets/custombutton.dart';
import 'camera_permission.dart';

class Notificationpermission extends StatefulWidget {
  const Notificationpermission({Key? key}) : super(key: key);

  @override
  State<Notificationpermission> createState() => _NotificationpermissionState();
}

class _NotificationpermissionState extends State<Notificationpermission> {
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
                        percent: 70 / 100,
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
                      VariableUtils.NotificationText,
                      style: FontTextStyle.GorditaW7S18darkBlack,
                    ),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Center(
                    child: Text(
                      VariableUtils.notificationSubText,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CameraPermission()));
                      },
                      title: 'Allow notifications/SMS',
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CameraPermission()));
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
