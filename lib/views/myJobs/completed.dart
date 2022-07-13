import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/views/home/Home%20Detail.dart';
import 'package:telescope_driver/views/myJobs/completed_job_detail.dart';
import '../../widgets/custombutton.dart';

import 'activejob_outfordelievery.dart';
import 'activejob_reachpickuplocation.dart';
import 'detailpage.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({Key? key}) : super(key: key);

  @override
  State<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
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
          SizedBox(
            height: 20.w,
          ),
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
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: 'Posted on ',
                        style: FontTextStyle.GorditaW5S10lightBlack,
                      ),
                      TextSpan(
                          text: 'Jan 23 - 11:10pm',
                          style: FontTextStyle.GorditaW7S10darkBlack.copyWith())
                    ])),
                    Container(
                      height: 9.w,
                      width: 9.w,
                      decoration: BoxDecoration(
                        color: ColorUtils.white,
                        border:
                            Border.all(color: ColorUtils.grey.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(3.sp),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.favorite_border,
                        color: ColorUtils.black,
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
              ],
            ),
          ),
          SizedBox(
            height: 5.w,
          ),
          Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: CustomButton(
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
                        builder: (context) => CompletedJobDetailPage(
                            // showContact: true,
                            )));
              },
            ),
          ),
          SizedBox(
            height: 5.w,
          )
        ],
      ),
    );
  }
}
