import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';

class customprofilecontainer extends StatefulWidget {
  final String? title;
  final Function()? onPressed;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double width;

  const customprofilecontainer(
      {Key? key,
      this.title,
      this.onPressed,
      this.textColor,
      this.backgroundColor,
      this.textStyle,
      this.height = kToolbarHeight,
      this.width = kToolbarHeight})
      : super(key: key);

  @override
  State<customprofilecontainer> createState() => _customprofilecontainerState();
}

class _customprofilecontainerState extends State<customprofilecontainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.w,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorUtils.primaryLight,
        border: Border.all(color: ColorUtils.white),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  // backgroundColor: ColorUtils.blue,
                  backgroundImage: AssetImage(ImageUtils.profile4),
                  radius: 6.w,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      VariableUtils.customer,
                      style: FontTextStyle.GorditaW5S10lightBlack,
                    ),
                    Text(
                      VariableUtils.custName1,
                      style: FontTextStyle.GorditaW5S10lightBlack.copyWith(
                          color: ColorUtils.black,
                          fontWeight: FontWeightClass.bold),
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                  ],
                ),
                // SizedBox(
                //   width: 25.w,
                // ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      VariableUtils.custPayment1,
                      style: FontTextStyle.GorditaW5S10lightBlack.copyWith(
                          color: ColorUtils.black,
                          fontWeight: FontWeightClass.bold),
                    ),
                    Text(
                      'Payment',
                      style: FontTextStyle.GorditaW5S10lightBlack,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
