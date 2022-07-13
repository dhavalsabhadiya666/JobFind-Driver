import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';

class CustomHomeAppbar extends StatefulWidget {
  final VoidCallback? backOnTap;
  final String? backIcon;
  final String? authIcon;
  final String? locationIcon;
  final String? titleName;
  final String? authName;
  final VoidCallback? authOnTap;
  final Widget? chatBox;

  const CustomHomeAppbar({
    Key? key,
    this.backOnTap,
    this.backIcon,
    this.locationIcon,
    this.titleName,
    this.authIcon,
    this.authName,
    this.authOnTap,
    this.chatBox,
  }) : super(key: key);

  @override
  State<CustomHomeAppbar> createState() => _CustomHomeAppbarState();
}

class _CustomHomeAppbarState extends State<CustomHomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: ColorUtils.red,
      // width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            //width: 60.w//color: Colors.red,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: GestureDetector(
                    onTap: widget.backOnTap ?? null,
                    child: Container(
                      padding: EdgeInsets.only(right: 2.w, top: 1.w),
                      child: SvgPicture.asset(
                        widget.backIcon ?? '',
                        height: 4.5.w,
                        color: ColorUtils.black,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  // VariableUtils.title,
                  widget.titleName ?? '',
                  style: FontTextStyle.GorditaW5S12lightBlack.copyWith(
                      color: ColorUtils.black,
                      fontWeight: FontWeightClass.bold,
                      fontSize: 14.sp),
                ),
                Spacer(),
                GestureDetector(
                  onTap: widget.authOnTap ?? null,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        widget.authIcon ?? '',
                        height: 5.w,
                        color: ColorUtils.black,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        widget.authName ?? '',
                        style: FontTextStyle.GorditaW5S12lightBlack.copyWith(
                            color: ColorUtils.accent),
                      ),
                    ],
                  ),
                ),
                if (widget.chatBox != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: widget.chatBox!,
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
