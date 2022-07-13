import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';

class customhomecontainer extends StatefulWidget {
  final String title;
  final Function()? onPressed;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double width;
  final VoidCallback? onTap;
  final String icon;

  const customhomecontainer({Key? key,
    required this.title,
    this.onPressed,
    this.textColor,
    this.backgroundColor,
    this.textStyle,
    required this.icon,
    this.onTap,
    this.height = kToolbarHeight,
    this.width = kToolbarHeight})
   : super(key: key);

  @override
  State<customhomecontainer> createState() => _customhomecontainerState();
}

class _customhomecontainerState extends State<customhomecontainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w), color: ColorUtils.primaryLight,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 8.w,
            width: 15.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.w),
                color: ColorUtils.primaryColor),

            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                    color: widget.textColor ?? ColorUtils.black,
                    // fontFamily: CustomTextstyleTheme.fontFamily,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(width: 3.w,),
          GestureDetector(
              onTap: widget.onTap ?? null,
              child: Center(
                child: SvgPicture.asset(widget.icon, height: 4.w),
              )),
          SizedBox(width: 2.w,),
        ],
      ),
    );
  }
}
