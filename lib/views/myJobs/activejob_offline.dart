import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/variable_utils.dart';

import '../home/widgets/home_appbar_custom.dart';

class ActiveJobsOffline extends StatefulWidget {
  const ActiveJobsOffline({Key? key}) : super(key: key);

  @override
  State<ActiveJobsOffline> createState() => _ActiveJobsOfflineState();
}

class _ActiveJobsOfflineState extends State<ActiveJobsOffline> {
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
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              backgroundColor: ColorUtils.accent,
                              title: Text(
                                VariableUtils.youOffline,
                                style: FontTextStyle.GorditaW5S12darkBlack
                                    .copyWith(color: ColorUtils.white),
                              ),
                              content: Text(
                                VariableUtils.youOfflineDetails,
                                style: FontTextStyle.GorditaW5S10lightBlack
                                    .copyWith(color: ColorUtils.white),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 8.w,
                          width: 22.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            color: ColorUtils.grey.withOpacity(0.5),
                            border: Border.all(color: ColorUtils.white),
                            boxShadow: [
                              BoxShadow(
                                color: ColorUtils.grey.withOpacity(0.2),
                                blurRadius: 2,
                                // spreadRadius: 1.5,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 1.w,
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: SvgPicture.asset(ImageUtils.backIcon,
                                        height: 4.w),
                                  )),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                height: 8.w,
                                width: 15.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.w),
                                    color: ColorUtils.black),
                                child: Center(
                                    child: Text(
                                  VariableUtils.offline,
                                  style: TextStyle(
                                      color: ColorUtils.grey,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700),
                                )),
                              ),
                            ],
                          ),
                        ))
                  ],
                )),
            preferredSize: Size.fromHeight(25.w),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(ImageUtils.offline, height: 200.w),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showcontent() {
    return new AlertDialog(
      actions: [],
    );
  }
}
