import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/font_style_utils.dart';

class CustomButton extends StatefulWidget {
  String title;
  Function()? onPressed;
  TextStyle? textStyle;
  Color? backgroundColor;
  Color? textColor;
  final double height;
  final double width;
  final double? borderRadius;
  final double? fontSize;

  CustomButton(
      {Key? key,
      required this.title,
      this.onPressed,
      this.textColor,
      this.backgroundColor,
      this.textStyle,
      this.height = kToolbarHeight,
      this.width = kToolbarHeight,
      this.borderRadius,
      this.fontSize})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 5.0),
        color: ColorUtils.darkBlack,
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            primary: widget.backgroundColor ?? Colors.transparent,
            //maximumSize: Size(double.infinity, 38),
            minimumSize: Size(double.infinity, 40),
            textStyle: widget.textStyle ?? FontTextStyle.GorditaW5S12lightBlack,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 5.0),
            )),
        child: Text(
          widget.title,
          style: TextStyle(
              color: widget.textColor ?? ColorUtils.primaryColor,
              fontSize: widget.fontSize ?? 10.sp,
              // fontFamily: CustomTextstyleTheme.fontFamily,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
