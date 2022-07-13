import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/font_style_utils.dart';
import '../../../utils/variable_utils.dart';

class CustomSettingList extends StatefulWidget {
  final VoidCallback? forwordTap;
  final String? forwordIcon;
  final String? titleName;
  const CustomSettingList(
      {Key? key, this.forwordTap, this.forwordIcon, this.titleName})
      : super(key: key);

  @override
  State<CustomSettingList> createState() => _CustomSettingListState();
}

class _CustomSettingListState extends State<CustomSettingList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: GestureDetector(
        onTap: widget.forwordTap ?? null,
        child: Container(
          padding: EdgeInsets.all(3.5.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.w),
              color: ColorUtils.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.titleName ?? '',
                style: FontTextStyle.GorditaW5S12darkBlack,
              ),
              SvgPicture.asset(
                widget.forwordIcon ?? '',
                height: 4.w,
                color: ColorUtils.black,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
