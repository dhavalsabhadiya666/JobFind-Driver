import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/viewmodel/bottom_bar_viewmodel.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/font_style_utils.dart';

class CustomSettingAppBar extends StatefulWidget {
  final VoidCallback? backOnTap;
  final String? backIcon;
  final VoidCallback? otherTap;
  final String? otherIcon;
  final String? titleName;
  final VoidCallback? onLikeTap;
  final bool? isShadow;

  const CustomSettingAppBar({
    Key? key,
    this.backOnTap,
    this.backIcon,
    this.titleName,
    this.otherTap,
    this.otherIcon,
    this.onLikeTap,
    this.isShadow = false,
  }) : super(key: key);

  @override
  State<CustomSettingAppBar> createState() => _CustomSettingAppBarState();
}

class _CustomSettingAppBarState extends State<CustomSettingAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.w),
      decoration: BoxDecoration(
          color: ColorUtils.white,
          boxShadow: widget.isShadow!
              ? [
                  BoxShadow(
                      color: ColorUtils.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0.0, 2.0)),
                ]
              : []),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.backOnTap ?? null,
            child: Container(
              //padding: EdgeInsets.all(5),
              padding: EdgeInsets.only(right: 3.w, top: 1.w),
              child: SvgPicture.asset(
                widget.backIcon ?? '',
                height: 5.w,
                color: ColorUtils.black,
              ),
            ),
          ),
          Spacer(),
          if (widget.titleName != null)
            Text(
              // VariableUtils.title,
              widget.titleName ?? '',
              style:
                  FontTextStyle.GorditaW7S12darkBlack.copyWith(fontSize: 13.sp),
            ),
          Spacer(),
          if (widget.onLikeTap != null)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                  onTap: widget.onLikeTap, child: Icon(Icons.favorite_border)),
            ),
          // Spacer(),
          if (widget.otherIcon != null)
            GestureDetector(
              onTap: widget.otherTap ?? null,
              child: SvgPicture.asset(
                widget.otherIcon ?? '',
                height: 5.w,
                color: ColorUtils.black,
              ),
            ),
        ],
      ),
    );
  }
}
