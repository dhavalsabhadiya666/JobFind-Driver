import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/common/loading_view.dart';
import 'package:telescope_driver/common/show_toast.dart';
import 'package:telescope_driver/model/apiModel/responseModel/common_res_model.dart';
import 'package:telescope_driver/utils/enum_utils.dart';
import 'package:telescope_driver/utils/pref_manager_utils.dart';
import 'package:telescope_driver/viewmodel/auth_viewmodel.dart';

import '../../utils/color_utils.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/image_utils.dart';
import '../../utils/variable_utils.dart';
import '../../widgets/CustomeTextFormFeild.dart';
import '../../widgets/SocialSignup.dart';
import '../../widgets/custom_appbar.dart';
import '../login/Login_screen.dart';

class GeneratePass extends StatefulWidget {
  const GeneratePass({Key? key}) : super(key: key);

  @override
  State<GeneratePass> createState() => _GeneratePassState();
}

class _GeneratePassState extends State<GeneratePass> {
  String? pass = '', confirmPass = '';
  GlobalKey<FormState> formKey = GlobalKey();
  AuthViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: GetBuilder<AuthViewModel>(
          builder: (controller) {
            return Stack(
              children: [
                Scaffold(
                  backgroundColor: ColorUtils.white,
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(20.w),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomAppBar(
                        backIcon: ImageUtils.backIcon,
                        backOnTap: () {
                          Navigator.of(context).pop();
                        },
                        locationIcon: ImageUtils.locationIcon,
                        titleName: VariableUtils.title,
                      ),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Form(
                      key: formKey,
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
                                  VariableUtils.Genratepass,
                                  style: FontTextStyle.GorditaW5S14darkBlack
                                      .copyWith(
                                          fontWeight: FontWeightClass.bold,
                                          fontSize: 16.sp),
                                ),
                                SizedBox(
                                  height: 2.w,
                                ),
                                Text(
                                  VariableUtils.Genratepasssubtitle,
                                  style: FontTextStyle.GorditaW5S12lightBlack,
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                CustomInputField(
                                  fieldName: 'Password',
                                  obscureText: true,
                                  maxLines: 1,
                                  validator: (str) {
                                    if (str!.isEmpty) {
                                      return '* Is Required';
                                    }
                                    return null;
                                  },
                                  onChange: (str) {
                                    pass = str;
                                  },
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                CustomInputField(
                                  fieldName: 'Confirm Password',
                                  obscureText: true,
                                  maxLines: 1,
                                  validator: (str) {
                                    if (str!.isEmpty) {
                                      return '* Is Required';
                                    } else if (pass != str) {
                                      return 'Password and confirm password not match';
                                    }
                                    return null;
                                  },
                                  onChange: (str) {
                                    confirmPass = str;
                                  },
                                ),
                                SizedBox(
                                  height: 8.w,
                                ),
                                CustomSocialButton(
                                  width: 30.w,
                                  height: 12.w,
                                  title: 'Signup',
                                  color: ColorUtils.primaryColor,
                                  textColor: ColorUtils.darkBlack,
                                  onTap: onTap,
                                  //               ForgotPasswordScreen()));
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                if (controller.setPasswordApiResponse.status == Status.LOADING)
                  LoadingView.postLoadingView()
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> onTap() async {
    if (formKey.currentState!.validate()) {
      await viewModel.setPassword(pass: confirmPass!);
      if (viewModel.setPasswordApiResponse.status == Status.COMPLETE) {
        CommonResModel response = viewModel.setPasswordApiResponse.data;
        if (response.sucecess == true) {
          showToast(title: response.message!, status: true);
          await PrefManagerUtils.setProfileSetupStatus(true);
          Get.off(Loginscreen());
        } else {
          // showToast(title: 'Sign up failed');
          showToast(title: response.message ?? 'Password not set');
        }
      } else {
        showToast(title: VariableUtils.somethingWantWrong);
      }
    }
  }
}
