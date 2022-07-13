import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/font_style_utils.dart';

class CustomSocialButton extends StatefulWidget {
  String title;
  Function()? onPressed;
  TextStyle? textStyle;
  Color? backgroundColor;
  Color? textColor;
  final double height;
  final double width;
  Color? color;
  final VoidCallback? onTap;

  CustomSocialButton(
      {Key? key,
      required this.title,
      this.onPressed,
        this.onTap,
      this.textColor,
      this.backgroundColor,
      this.textStyle,
      this.color,
      this.height = kToolbarHeight,
      this.width = kToolbarHeight})
      : super(key: key);

  @override
  _CustomSocialButtonState createState() => _CustomSocialButtonState();
}

class _CustomSocialButtonState extends State<CustomSocialButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? null,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: widget.color),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                  color: widget.textColor,
                  // fontFamily: CustomTextstyleTheme.fontFamily,
                  fontWeight: FontWeight.w700),
            ),
          ),
        
      ),
    );
  }
}
