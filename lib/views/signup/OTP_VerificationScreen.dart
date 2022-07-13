import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/common/loading_view.dart';
import 'package:telescope_driver/common/show_toast.dart';
import 'package:telescope_driver/model/apiModel/responseModel/common_res_model.dart';
import 'package:telescope_driver/model/apiModel/responseModel/resend_otp_res_model.dart';
import 'package:telescope_driver/utils/enum_utils.dart';
import 'package:telescope_driver/utils/pref_manager_utils.dart';
import 'package:telescope_driver/utils/validation_utils.dart';
import 'package:telescope_driver/viewmodel/auth_viewmodel.dart';
import '../../utils/color_utils.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/image_utils.dart';
import '../../utils/variable_utils.dart';
import '../../widgets/CustomeTextFormFeild.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_round_button.dart';
import 'Genratepassword_screen.dart';

class OTPVarification extends StatefulWidget {
  const OTPVarification(
      {Key? key,
      required this.otp,
      // required this.userId,
      required this.pNumber})
      : super(key: key);
  final String otp;

  // final String userId;
  final String pNumber;

  @override
  State<OTPVarification> createState() => _OTPVarificationState();
}

class _OTPVarificationState extends State<OTPVarification> {
  String? enteredOtp;
  GlobalKey<FormState> formKey = GlobalKey();
  AuthViewModel viewModel = Get.find();
  late String otp;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    print('OTP : ${widget.otp}');
    print('NUMBER : ${widget.pNumber}');
    // print('USER ID : ${widget.userId}');
    otp = widget.otp;
    viewModel.resendOtpInit();
    viewModel.checkOtpInit();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: GetBuilder<AuthViewModel>(
        builder: (controller) {
          return SafeArea(
            child: Stack(
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
                                  'Verification Code',
                                  style: FontTextStyle.GorditaW5S14darkBlack
                                      .copyWith(
                                          fontWeight: FontWeightClass.bold,
                                          fontSize: 16.sp),
                                ),
                                SizedBox(
                                  height: 3.w,
                                ),
                                Text(
                                  'Enter 6 digit code to your phone \nnumber ${widget.pNumber}',
                                  style: FontTextStyle.GorditaW5S12lightBlack,
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                CustomInputField(
                                  validator: (str) {
                                    if (str!.isEmpty) {
                                      return '* Is Required';
                                    }

                                    return null;
                                  },
                                  inputFormat: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(4)
                                  ],
                                  fieldInputType: TextInputType.number,
                                  onChange: (str) {
                                    enteredOtp = str;
                                  },
                                  fieldName: 'Verification Code',
                                ),
                                SizedBox(
                                  height: 20.w,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: sendOtpOnTap,
                                        child: Text(
                                          VariableUtils.Resendcode,
                                          style: FontTextStyle
                                              .GorditaW5S12darkBlackunderline,
                                        )),
                                    CustomRoundButton(
                                      onTap: checkOtpOnTap,
                                      icon: ImageUtils.forwardIcon,
                                    )
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
                if (controller.checkOtpApiResponse.status == Status.LOADING ||
                    controller.resendOtpApiResponse.status == Status.LOADING)
                  LoadingView.postLoadingView()
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> sendOtpOnTap() async {
    await viewModel.resendOtp();
    if (viewModel.resendOtpApiResponse.status == Status.COMPLETE) {
      OtpResendResModel response = viewModel.resendOtpApiResponse.data;
      if (response.sucecess == true) {
        showToast(
            title:
                response.message! + 'OTP IS ${response.data!.otp.toString()}',
            status: true);
        setState(() {
          otp = response.data!.otp.toString();
        });
      } else {
        // showToast(title: 'Sign up failed');
        showToast(title: response.message ?? 'Otp not send');
      }
    } else {
      showToast(title: VariableUtils.somethingWantWrong);
    }
  }

  Future<void> checkOtpOnTap() async {
    Get.offAll(GeneratePass());
    return;
    if (formKey.currentState!.validate()) {
      await viewModel.checkOtp(otp: enteredOtp!);
      if (viewModel.checkOtpApiResponse.status == Status.COMPLETE) {
        CommonResModel response = viewModel.checkOtpApiResponse.data;
        if (response.sucecess == true) {
          showToast(title: response.message!, status: true);
          await PrefManagerUtils.setUserRegisterStatus(true);
          await PrefManagerUtils.setProfileSetupStatus(false);
          Get.offAll(GeneratePass());
        } else {
          // showToast(title: 'Sign up failed');
          showToast(title: response.message ?? 'Otp is wrong');
        }
      } else {
        showToast(title: VariableUtils.somethingWantWrong);
      }
    }
  }
}
