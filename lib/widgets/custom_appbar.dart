import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';

class CustomAppBar extends StatefulWidget {
  final VoidCallback? backOnTap;
  final String? backIcon;
  final String? locationIcon;
  final String? titleName;
  final String? authName;
  final VoidCallback? authOnTap;

  const CustomAppBar({
    Key? key,
    this.backOnTap,
    this.backIcon,
    this.locationIcon,
    this.titleName,
    this.authName,
    this.authOnTap,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60.w,
                //color: Colors.red,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: widget.backOnTap ?? null,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 3.w, right: 2.w, top: 3.w, bottom: 3.w),
                        child: SvgPicture.asset(
                          widget.backIcon ?? '',
                          height: 4.5.w,
                          color: ColorUtils.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    SvgPicture.asset(
                      widget.locationIcon ?? '',
                      //ImageUtils.locationIcon,
                      fit: BoxFit.cover,
                      height: 8.w,
                      width: 7.w,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      // VariableUtils.title,
                      widget.titleName ?? '',
                      style: FontTextStyle.GorditaW5S14lightBlack.copyWith(
                          color: ColorUtils.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeightClass.bold),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: widget.authOnTap ?? null,
                child: Container(
                  width: 20.w,
                  height: 9.w,
                  // color: Colors.red,
                  child: widget.authName == null
                      ? SizedBox()
                      : Container(
                          padding: EdgeInsets.all(1.7.w),
                          decoration: BoxDecoration(
                              color: ColorUtils.black,
                              borderRadius: BorderRadius.circular(1.w)),
                          child: Center(
                            child: Text(
                              widget.authName ?? '',
                              style:
                                  FontTextStyle.GorditaW7S10darkBlack.copyWith(
                                      color: ColorUtils.primaryColor),
                            ),
                          ),
                        ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
