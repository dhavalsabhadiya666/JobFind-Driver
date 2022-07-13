import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:telescope_driver/views/myjobs/widgets/customhomecontainer.dart';
import 'package:telescope_driver/views/myjobs/widgets/customprofilecontainer.dart';

import '../../widgets/custombutton.dart';
import '../home/widgets/home_appbar_custom.dart';
import 'activejob_sendconfirmation.dart';
import 'activejob_verifypickuplocation.dart';

class ActiveJobReachPickUpLocation extends StatefulWidget {
  const ActiveJobReachPickUpLocation({Key? key}) : super(key: key);

  @override
  State<ActiveJobReachPickUpLocation> createState() =>
      _ActiveJobReachPickUpLocationState();
}

class _ActiveJobReachPickUpLocationState
    extends State<ActiveJobReachPickUpLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
                child: CustomHomeAppbar(
                  backIcon: ImageUtils.backIcon,
                  titleName: VariableUtils.activejob1,
                  backOnTap: () {
                    Navigator.pop(context);
                  },
                  authIcon: ImageUtils.appBarMsg,
                )),
            preferredSize: Size.fromHeight(15.w),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageUtils.reachPickupMap,
                        height: 200,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                      SvgPicture.asset(
                        ImageUtils.upward,
                        height: 2.w,
                        width: 2.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.w,
                ),
                Container(
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: ColorUtils.grey.withOpacity(0.1),
                  ),
                  child: Center(
                      child: Text(
                    VariableUtils.swipeUp,
                    style: FontTextStyle.GorditaW5S10lightBlack.copyWith(
                        color: ColorUtils.black),
                  )),
                ),
                SizedBox(
                  height: 1.w,
                ),
                customprofilecontainer(),
                SizedBox(
                  height: 5.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          VariableUtils.pickupdesk,
                          style: FontTextStyle.GorditaW5S12darkBlack.copyWith(
                              fontWeight: FontWeightClass.bold,
                              fontSize: 14.sp),
                        ),
                        Row(
                          children: [
                            Text(
                              VariableUtils.pickupdeskk,
                              style:
                                  FontTextStyle.GorditaW5S12darkBlack.copyWith(
                                      fontWeight: FontWeightClass.bold,
                                      fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Container(
                    color: ColorUtils.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  VariableUtils.pickupLocation1,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(
                                          color: ColorUtils.black,
                                          fontWeight: FontWeightClass.bold,
                                          fontSize: 12.sp),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.w, horizontal: 5.w),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.aliceBlue,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text(
                                    VariableUtils.pickdate,
                                    style: FontTextStyle.GorditaW5S10lightBlack
                                        .copyWith(
                                      color: ColorUtils.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  VariableUtils.PickAddress1,
                                  style: FontTextStyle.GorditaW5S10lightBlack,
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Text(
                                  VariableUtils.PickAddress2,
                                  style: FontTextStyle.GorditaW5S10lightBlack,
                                ),
                              ],
                            ),
                            Divider(),
                            SizedBox(
                              height: 1.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  VariableUtils.dropOffLocation1,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(
                                          color: ColorUtils.black,
                                          fontWeight: FontWeightClass.bold,
                                          fontSize: 12.sp),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.w, horizontal: 5.w),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.aliceBlue,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text(
                                    VariableUtils.dropoffdate,
                                    style: FontTextStyle.GorditaW5S10lightBlack
                                        .copyWith(
                                      color: ColorUtils.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  VariableUtils.dropOffAddress1,
                                  style: FontTextStyle.GorditaW5S10lightBlack,
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Text(
                                  VariableUtils.dropOffAddress2,
                                  style: FontTextStyle.GorditaW5S10lightBlack,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                  child: CustomButton(
                    width: double.infinity,
                    height: 12.w,
                    title: 'Arrived at Pickup Location',
                    backgroundColor: ColorUtils.darkBlack,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ActiveJobVerifyPickUpLocation()));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
