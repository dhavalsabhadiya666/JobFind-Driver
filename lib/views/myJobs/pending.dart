import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telescope_driver/utils/color_utils.dart';

import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/views/home/Home%20Detail.dart';
import '../../widgets/custombutton.dart';
import 'activejob_reachpickuplocation.dart';

class PendingPage extends StatefulWidget {
  const PendingPage({Key? key}) : super(key: key);

  @override
  State<PendingPage> createState() => _PendingPageState();
}

class _PendingPageState extends State<PendingPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        children: [
          SizedBox(
            height: 8.w,
          ),
          showCard(context),
          // showCard(context),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ActiveJobReachPickUpLocation()));
            },
            child: Container(
              height: 45,
              width: 240,
              decoration: BoxDecoration(
                color: ColorUtils.accent,
                borderRadius: BorderRadius.circular(15.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Current Active Jobs',
                    style: FontTextStyle.gilroyW7S12primaryColor.copyWith(
                      color: ColorUtils.white,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  SvgPicture.asset(
                    ImageUtils.forwardIcon,
                    height: 3.5.w,
                    color: ColorUtils.white,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5.w,
          )
        ],
      ),
    );
  }

  Container showCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorUtils.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ready for pickup',
                      style: FontTextStyle.GorditaW5S12lightBlack.copyWith(
                          fontSize: 10.sp),
                    ),
                    Container(
                      height: 9.w,
                      width: 9.w,
                      decoration: BoxDecoration(
                        color: ColorUtils.lightRed,
                        borderRadius: BorderRadius.circular(3.sp),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.favorite,
                        color: ColorUtils.red,
                        size: 18,
                      )
                          // SvgPicture.asset(
                          //   ImageUtils.like,
                          //   height: 4.w,
                          //   color: ColorUtils.white,
                          // ),
                          ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      VariableUtils.pickupdesk,
                      style: FontTextStyle.GorditaW5S12darkBlack.copyWith(
                          fontWeight: FontWeightClass.bold, fontSize: 14.sp),
                    ),
                    Row(
                      children: [
                        Text(
                          VariableUtils.pickupdeskk,
                          style: FontTextStyle.GorditaW5S12darkBlack.copyWith(
                              fontWeight: FontWeightClass.bold,
                              fontSize: 14.sp),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 0.5.w),
                          // height: 4.5.w,
                          // width: 20.w,
                          decoration: BoxDecoration(
                              color: ColorUtils.white,
                              borderRadius: BorderRadius.circular(10.w)),
                          child: Center(
                              child: Text(
                            VariableUtils.milis,
                            style: FontTextStyle.GorditaW5S10darkBlack,
                          )),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 0.5.w),
                          // height: 4.5.w,
                          // width: 20.w,
                          decoration: BoxDecoration(
                              color: ColorUtils.primaryColor,
                              borderRadius: BorderRadius.circular(10.w)),
                          child: Center(
                              child: Text(
                            '\$250 Bid',
                            style: FontTextStyle.GorditaW5S10darkBlack,
                          )),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5.w,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: ColorUtils.primaryColor,
                                radius: 5,
                              ),
                              Container(
                                height: 90,
                                child: Column(
                                  children: List.generate(
                                    10,
                                    (ii) => Padding(
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 3,
                                            bottom: 3),
                                        child: Container(
                                          height: 3,
                                          width: 2,
                                          color: Colors.grey,
                                        )),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(.5),
                                radius: 5,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: LayoutBuilder(
                                    builder: (context, constraint) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            VariableUtils.pickup,
                                            style: FontTextStyle
                                                    .GorditaW5S10lightBlack
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeightClass.bold),
                                          ),
                                          Text(
                                            VariableUtils.Pichaddress,
                                            style: FontTextStyle
                                                    .GorditaW5S10lightBlack
                                                .copyWith(
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                          Text(
                                            VariableUtils.pickdate,
                                            style: FontTextStyle
                                                    .GorditaW5S10lightBlack
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeightClass.bold,
                                                    color: ColorUtils.black
                                                        .withOpacity(0.5)),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  VariableUtils.Dropofftitle,
                                                  style: FontTextStyle
                                                          .GorditaW5S10lightBlack
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeightClass
                                                                  .bold),
                                                ),
                                                Text(
                                                  VariableUtils.dropoffaddress,
                                                  style: FontTextStyle
                                                          .GorditaW5S10lightBlack
                                                      .copyWith(
                                                    fontSize: 11.sp,
                                                  ),
                                                ),
                                                Text(
                                                  VariableUtils.dropoffdate,
                                                  style: FontTextStyle
                                                          .GorditaW5S10lightBlack
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeightClass
                                                                  .bold,
                                                          color: ColorUtils
                                                              .black
                                                              .withOpacity(
                                                            0.5,
                                                          )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.w,
          ),
          Divider(
            color: ColorUtils.black,
          ),
          Container(
            padding: EdgeInsets.all(10.00),
            child: Row(
              children: [
                SizedBox(
                  width: 1.w,
                ),
                Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    CircleAvatar(
                      // backgroundColor: ColorUtils.blue,
                      backgroundImage: AssetImage(ImageUtils.profile3),
                      radius: 5.w,
                    ),
                    Positioned(
                      bottom: -5,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: ColorUtils.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(vertical: 1),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              size: 12,
                              color: ColorUtils.black,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Text(
                        VariableUtils.custName,
                        style: FontTextStyle.GorditaW5S10lightBlack,
                      ),
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Text(
                        'Lippy Sukodu',
                        style: FontTextStyle.GorditaW7S10darkBlack,
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(1.w),
                    //   // height: 6.w,
                    //   // width: 35.w,
                    //   decoration: BoxDecoration(
                    //       color: ColorUtils.lightBlack
                    //           .withOpacity(0.07),
                    //       borderRadius:
                    //           BorderRadius.circular(10.w)),
                    //   child: Center(
                    //     child: Text(
                    //       VariableUtils.custPayment,
                    //       style: FontTextStyle
                    //               .GorditaW5S10lightBlack
                    //           .copyWith(color: ColorUtils.black),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Spacer(),
                CustomButton(
                  width: 32.w,
                  height: 10.w,
                  // height: 10.w,
                  title: 'Get Details',
                  textColor: ColorUtils.primaryColor,
                  backgroundColor: ColorUtils.darkBlack,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeDetailPage(
                                // showContact: true,
                                )));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
