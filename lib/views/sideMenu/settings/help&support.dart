import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';

import '../../../utils/image_utils.dart';
import '../../../widgets/CustomeTextFormFeild.dart';
import '../../../widgets/custombutton.dart';
import '../../Message/Widgets/custome_appbar.dart';

import '../widgets/custometextformfeild.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  TextEditingController _yourname = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
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
              titleName: VariableUtils.supportreq,
              backOnTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            //color: ColorUtils.red,
            height: 80,

            width: Get.width,
            child: CustomButton(
                height: 20.w,
                borderRadius: 0,
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: ColorUtils.darkBlack,
                title: 'Send Request'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   VariableUtils.supportreq,
                  //   style: FontTextStyle.GorditaW5S14darkBlack.copyWith(
                  //       fontWeight: FontWeightClass.bold, fontSize: 16.sp),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    fieldController: _yourname,
                    fieldName: 'Your name',
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  CustomInputField(
                    fieldController: _yourname,
                    fieldName: 'Email address',
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.message,
                    style: FontTextStyle.GorditaW7S10darkBlack,
                  ),
                  CustomFormField(
                    height: 25.w,
                    fieldController: _yourname,
                    hint: 'Type here message...',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
