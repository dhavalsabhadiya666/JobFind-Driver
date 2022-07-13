import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../utils/color_utils.dart';

class CustomChargeButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String icon;
  final String text;
  const CustomChargeButton({Key? key, required this.icon,required this.text, this.onTap, required TextStyle style})
      : super(key: key);

  @override
  State<CustomChargeButton> createState() => _CustomChargeButtonState();
}

class _CustomChargeButtonState extends State<CustomChargeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17.w,
      width: 100.w,
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: ColorUtils.accent,
      ),
      child: GestureDetector(
          onTap: widget.onTap ?? null,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: ColorUtils.white,
                    shape: BoxShape.circle,

                  ),
                  child: SvgPicture.asset(widget.icon, height: 6.w,color: ColorUtils.primaryColor,)),
              SizedBox(width: 2.w,),
              Text(widget.text),
            ],
          )),
    );
  }
}
