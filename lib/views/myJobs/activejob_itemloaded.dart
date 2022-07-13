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
import 'activejob_outfordelievery.dart';
import 'activejob_verifypickuplocation.dart';

class ActiveJobItemLoaded extends StatefulWidget {
  const ActiveJobItemLoaded({Key? key}) : super(key: key);

  @override
  State<ActiveJobItemLoaded> createState() => _ActiveJobItemLoadedState();
}

class _ActiveJobItemLoadedState extends State<ActiveJobItemLoaded> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
                child: Column(
                  children: [
                    CustomHomeAppbar(
                      backIcon: ImageUtils.backIcon,
                      titleName: VariableUtils.activejob1,
                      backOnTap: () {
                        Navigator.pop(context);
                      },
                      authIcon: ImageUtils.appBarMsg,
                    ),
                    // SizedBox(
                    //   height: 1.w,
                    // ),
                    // customhomecontainer(
                    //   height: 8.w,
                    //   width: 25.w,
                    //   title: VariableUtils.online,
                    //   icon: ImageUtils.forwardIcon,
                    // )
                  ],
                )),
            preferredSize: Size.fromHeight(15.w),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageUtils.verifyPickupMap,
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
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                        SizedBox(
                          height: 3.w,
                        ),
                        Container(
                          color: ColorUtils.white,
                          padding: EdgeInsets.all(2.w),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        VariableUtils.pickupLocation1,
                                        style:
                                            FontTextStyle.GorditaW5S10lightBlack
                                                .copyWith(
                                                    color: ColorUtils.black,
                                                    fontWeight:
                                                        FontWeightClass.bold,
                                                    fontSize: 12.sp),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(2.w),
                                        decoration: BoxDecoration(
                                            color: ColorUtils.aliceBlue,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          'Feb 28 - 10:30pm',
                                          style: FontTextStyle
                                              .GorditaW5S10lightBlack.copyWith(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(VariableUtils.PickAddress1,
                                          style: FontTextStyle
                                                  .GorditaW5S10lightBlack
                                              .copyWith(fontSize: 12.sp)),
                                      SizedBox(
                                        height: 1.w,
                                      ),
                                      Text(
                                        VariableUtils.PickAddress2,
                                        style: FontTextStyle
                                            .GorditaW5S10lightBlack,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(),
                              SizedBox(
                                height: 4.w,
                              ),
                              Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            VariableUtils.dropOffLocation1,
                                            style: FontTextStyle
                                                    .GorditaW5S10lightBlack
                                                .copyWith(
                                                    color: ColorUtils.black,
                                                    fontWeight:
                                                        FontWeightClass.bold,
                                                    fontSize: 12.sp),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(2.w),
                                            decoration: BoxDecoration(
                                                color: ColorUtils.aliceBlue,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              'Mar 2 - 3:00pm',
                                              style: FontTextStyle
                                                      .GorditaW5S10lightBlack
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            VariableUtils.dropOffAddress1,
                                            style: FontTextStyle
                                                .GorditaW5S10lightBlack,
                                          ),
                                          SizedBox(
                                            height: 1.w,
                                          ),
                                          Text(
                                            VariableUtils.dropOffAddress2,
                                            style: FontTextStyle
                                                .GorditaW5S10lightBlack,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        CustomButton(
                          width: double.infinity,
                          height: 12.w,
                          title: 'Items Loaded',
                          backgroundColor: ColorUtils.darkBlack,
                          onPressed: () {
                            showModalBottomSheet(
                                enableDrag: true,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return showModelBottomsuccess();
                                });
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.w,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showModelBottomsuccess() {
    return Container(
      height: 120.w,
      color: ColorUtils.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.w,
                  ),
                  Text(
                    VariableUtils.takePicture,
                    style: FontTextStyle.GorditaW5S14darkBlack.copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3.w,
                  ),
                  Text(
                    VariableUtils.takePictureDetail,
                    style: FontTextStyle.GorditaW5S12lightBlack,
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                ],
              )),
          SizedBox(
            height: 5.w,
          ),
          Center(
            child: Image.asset(
              ImageUtils.truck,
              height: 50.w,
              width: 90.w,
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActiveJobOutforDelivery()));
                },
                child: Container(
                  height: 20.w,
                  width: double.infinity,
                  decoration: BoxDecoration(color: ColorUtils.darkBlack),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 3.w,
                      ),
                      Text(
                        VariableUtils.pickUpDone,
                        style: FontTextStyle.GorditaW5S12lightBlack.copyWith(
                            color: ColorUtils.primaryColor,
                            fontWeight: FontWeightClass.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
