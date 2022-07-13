import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/font_style_utils.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/variable_utils.dart';
import '../../Message/Widgets/custome_appbar.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorUtils.white,
          // appBar: PreferredSize(
          //   preferredSize: Size.fromHeight(15.w),
          //   child: CustomSettingAppBar(
          //     backIcon: ImageUtils.backIcon,
          //     backOnTap: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(15.w),
            child: CustomSettingAppBar(
              backIcon: ImageUtils.backIcon,
              isShadow: true,
              titleName: 'About Us',
              backOnTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   VariableUtils.aboutus,
                  //   style: FontTextStyle.GorditaW5S14darkBlack.copyWith(
                  //       fontWeight: FontWeightClass.bold, fontSize: 16.sp),
                  // ),
                  // SizedBox(
                  //   height: 4.w,
                  // ),
                  // Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    VariableUtils.aboutustittle,
                    style: FontTextStyle.GorditaW7S12darkBlack,
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Text(
                    VariableUtils.aboutusdesc1,
                    style: FontTextStyle.GorditaW5S10lightBlack,
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Image.asset(ImageUtils.aboutus),
                  SizedBox(
                    height: 4.w,
                  ),
                  Text(
                    VariableUtils.aboutustitle1,
                    style: FontTextStyle.GorditaW7S12darkBlack,
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Text(
                    VariableUtils.aboutusdesc1,
                    style: FontTextStyle.GorditaW5S10lightBlack,
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Text(
                    VariableUtils.aboutusdesc2,
                    style: FontTextStyle.GorditaW5S10lightBlack,
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Image.asset(ImageUtils.aboutus2),
                  SizedBox(
                    height: 2.w,
                  ),
                  Text(
                    VariableUtils.aboutustitle2,
                    style: FontTextStyle.GorditaW7S12darkBlack,
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Text(
                    VariableUtils.aboutusdesc3,
                    style: FontTextStyle.GorditaW5S10lightBlack,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
