import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../utils/color_utils.dart';
import '../utils/font_style_utils.dart';

class CustomUploadButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String icon;
  final String text;
  const CustomUploadButton(
      {Key? key, required this.icon, required this.text, this.onTap})
      : super(key: key);

  @override
  State<CustomUploadButton> createState() => _CustomUploadButtonState();
}

class _CustomUploadButtonState extends State<CustomUploadButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? null,
      child: Container(
        height: 40.w,
        width: 100.w,
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(color: ColorUtils.aliceBlue),
        child: GestureDetector(
            onTap: widget.onTap ?? null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(3.w),
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
                    child: SvgPicture.asset(widget.icon, height: 3.5.w)),
                SizedBox(
                  height: 5.w,
                ),
                Text(widget.text, style: FontTextStyle.GorditaW5S12lightBlack),
              ],
            )),
      ),
    );
  }
}
