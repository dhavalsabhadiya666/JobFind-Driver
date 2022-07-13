import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../utils/color_utils.dart';

class CustomRoundButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String icon;
  const CustomRoundButton({Key? key, required this.icon, this.onTap})
      : super(key: key);

  @override
  State<CustomRoundButton> createState() => _CustomRoundButtonState();
}

class _CustomRoundButtonState extends State<CustomRoundButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? null ,
      child: Container(
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          color: ColorUtils.primaryColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: ColorUtils.primaryLight,
              blurRadius: 18,
              spreadRadius: 1.5,
              offset: Offset(6.0, 5.0),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(widget.icon, height: 4.w),
        ),
      ),
    );
  }
}
