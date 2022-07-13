import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/font_style_utils.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/variable_utils.dart';
import '../../../widgets/CustomeTextFormFeild.dart';
import '../../../widgets/custombutton.dart';
import '../../Message/Widgets/custome_appbar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: SizedBox(
            height: 11.w,
            width: 35.w,
            child: FloatingActionButton(
              elevation: 0.0,
              // shape: BeveledRectangleBorder(
              //     borderRadius: BorderRadius.circular(1.w)),
              onPressed: () {},
              child: CustomButton(
                title: "Save",
                onPressed: () {
                  Navigator.pop(context);
                },
                width: 35.w,
                backgroundColor: ColorUtils.primaryColor,
                textColor: ColorUtils.black,
              ),
            ),
          ),
          backgroundColor: ColorUtils.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(15.w),
            child: CustomSettingAppBar(
              backIcon: ImageUtils.backIcon,
              isShadow: true,
              titleName: 'Change Password',
              backOnTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            //color: ColorUtils.red,
            //height: 800,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.w,
                    ),
                    CustomInputField(
                        fieldName: 'Old Password',
                        fieldController: _oldPasswordController),
                    SizedBox(
                      height: 4.w,
                    ),
                    CustomInputField(
                        fieldName: 'New Password',
                        fieldController: _newPasswordController),
                    SizedBox(
                      height: 4.w,
                    ),
                    CustomInputField(
                        fieldName: 'Confirm Password',
                        fieldController: _confirmPasswordController),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
