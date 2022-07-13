import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/font_style_utils.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/variable_utils.dart';
import '../../Message/Widgets/custome_appbar.dart';

class TermAndConditionSettingScreen extends StatefulWidget {
  const TermAndConditionSettingScreen({Key? key}) : super(key: key);

  @override
  State<TermAndConditionSettingScreen> createState() =>
      _TermAndConditionSettingScreenState();
}

class _TermAndConditionSettingScreenState
    extends State<TermAndConditionSettingScreen> {
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
              titleName: VariableUtils.terms,
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
                  //   VariableUtils.terms,
                  //   style: FontTextStyle.GorditaW5S14darkBlack.copyWith(
                  //       fontWeight: FontWeightClass.bold, fontSize: 16.sp),
                  // ),
                  // SizedBox(
                  //   height: 3.w,
                  // ),
                  // Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    VariableUtils.termsdesc,
                    style: FontTextStyle.GorditaW5S10lightBlack,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.informationcollection,
                    style: FontTextStyle.GorditaW5S14darkBlack,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Text(
                        '1.',
                        style: FontTextStyle.GorditaW5S10lightBlack,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(
                        child: Text(
                          VariableUtils.informatindesc1,
                          style: FontTextStyle.GorditaW5S10lightBlack,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Text(
                        '2.',
                        style: FontTextStyle.GorditaW5S10lightBlack,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(
                        child: Text(
                          VariableUtils.informatindesc2,
                          style: FontTextStyle.GorditaW5S10lightBlack,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.security,
                    style: FontTextStyle.GorditaW5S14darkBlack,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.securitydesc,
                    style: FontTextStyle.GorditaW5S10lightBlack,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.applicationlaw,
                    style: FontTextStyle.GorditaW5S14darkBlack,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.applicationdesc,
                    style: FontTextStyle.GorditaW5S10lightBlack,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.googleanalytics,
                    style: FontTextStyle.GorditaW5S14darkBlack,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.googleanalyticsdesc,
                    style: FontTextStyle.GorditaW5S10lightBlack,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.googleanalyticsdesc1,
                    style: FontTextStyle.GorditaW5S10lightBlack,
                  ),
                  Text(
                    VariableUtils.emailterms,
                    style: FontTextStyle.GorditaW5S10lightBlack.copyWith(
                        color: ColorUtils.accent),
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
