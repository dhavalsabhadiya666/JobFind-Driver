import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/image_utils.dart';
import '../../utils/variable_utils.dart';
import '../../widgets/CustomeTextFormFeild.dart';
import '../../widgets/custom_round_button.dart';
import '../../widgets/custom_appbar.dart';
import 'Login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController _pass = new TextEditingController();
  TextEditingController _resetpass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorUtils.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: ColorUtils.white,
            appBar: PreferredSize(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.w),
                child: CustomAppBar(
                  backIcon: ImageUtils.backIcon,
                  backOnTap: () {
                    Navigator.pop(context);
                  },
                  locationIcon: ImageUtils.locationIcon,
                  titleName: VariableUtils.title,
                ),
              ),
              preferredSize: Size.fromHeight(20.w),
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5.w,
                          ),
                          Text(
                            VariableUtils.resetPassword,
                            style: FontTextStyle.GorditaW5S14darkBlack.copyWith(
                                fontWeight: FontWeightClass.bold,
                                fontSize: 16.sp),
                          ),
                          Text(
                            VariableUtils.resetPasswordDes,
                            style: FontTextStyle.GorditaW5S10lightBlack,
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          CustomInputField(
                            fieldName: 'Password',
                            fieldController: _pass,
                            obscureText: true,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          CustomInputField(
                              fieldName: 'Confirm Password',
                              obscureText: true,
                              maxLines: 1,
                              fieldController: _resetpass),
                          SizedBox(
                            height: 12.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomRoundButton(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Loginscreen()));
                                  },
                                  icon: ImageUtils.forwardIcon),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
