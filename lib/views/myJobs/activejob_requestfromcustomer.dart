import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';

import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:telescope_driver/views/myjobs/rejectionreason.dart';
import 'package:telescope_driver/views/myjobs/widgets/customhomecontainer.dart';
import '../../widgets/custombutton.dart';
import '../home/widgets/home_appbar_custom.dart';
import '../Message/messagenotification_screen.dart';
import 'activejob_offline.dart';
import 'activejob_reachpickuplocation.dart';
import 'activejob_verifypickuplocation.dart';

class ActiveJobRequestFromCustomer extends StatefulWidget {
  const ActiveJobRequestFromCustomer({Key? key}) : super(key: key);

  @override
  State<ActiveJobRequestFromCustomer> createState() =>
      _ActiveJobRequestFromCustomerState();
}

class _ActiveJobRequestFromCustomerState
    extends State<ActiveJobRequestFromCustomer> {
  int _selectedIndex = 0;

  List ls = ['Accept Job', "Decline Job"];

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
                      authOnTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationScreen()));
                      },
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    GestureDetector(
                      child: customhomecontainer(
                        height: 8.w,
                        width: 25.w,
                        title: VariableUtils.online,
                        icon: ImageUtils.forwardIcon,
                      ),
                    )
                  ],
                )),
            preferredSize: Size.fromHeight(25.w),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageUtils.statusYourJob1,
                            height: 50.w,
                            width: double.infinity,
                          ),
                        ],
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
                    color: ColorUtils.accent,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          VariableUtils.jobRequest,
                          style: FontTextStyle.GorditaW5S10lightBlack.copyWith(
                              color: ColorUtils.white,
                              fontSize: 8.sp,
                              fontWeight: FontWeightClass.bold),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Flexible(
                          child: Text(
                            VariableUtils.jobRequest1,
                            style:
                                FontTextStyle.GorditaW5S10lightBlack.copyWith(
                                    fontSize: 8.sp, color: ColorUtils.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.w,
                ),
                Container(
                  color: ColorUtils.darkBlack,
                  height: 16.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              // backgroundColor: ColorUtils.blue,
                              backgroundImage: AssetImage(ImageUtils.profile4),
                              radius: 6.w,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  VariableUtils.customer,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(color: ColorUtils.white),
                                ),
                                Text(
                                  VariableUtils.custName1,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(
                                          color: ColorUtils.white,
                                          fontWeight: FontWeightClass.bold),
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  VariableUtils.custPayment1,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(
                                          color: ColorUtils.white,
                                          fontWeight: FontWeightClass.bold),
                                ),
                                Text(
                                  VariableUtils.custPayment2,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(color: ColorUtils.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // customprofilecontainer(backgroundColor: ColorUtils.darkBlack,),
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
                                          VariableUtils.dropoffdate,
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
                                      Text(
                                        VariableUtils.PickAddress1,
                                        style: FontTextStyle
                                            .GorditaW5S10lightBlack,
                                      ),
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
                                              VariableUtils.dropoffdate,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              width: 40.w,
                              height: 12.w,
                              title: 'Accept Job',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ActiveJobReachPickUpLocation()));
                              },
                              backgroundColor: ColorUtils.primaryColor,
                              textColor: ColorUtils.black,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            CustomButton(
                              width: 40.w,
                              height: 12.w,
                              title: 'Decline Job',
                              onPressed: () {
                                setState(() {
                                  showModalBottomSheet(
                                      enableDrag: true,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return showModelBottomsuccess1();
                                      });
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeDetailPage()));
                                });
                              },
                              backgroundColor: ColorUtils.readLight,
                              textColor: ColorUtils.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showModelBottomsuccess1() {
    return Container(
      height: 120.w,
      color: ColorUtils.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [RejectionReason()],
        ),
      ),
    );
  }
}
