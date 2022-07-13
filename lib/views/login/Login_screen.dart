import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/common/loading_view.dart';
import 'package:telescope_driver/common/show_toast.dart';
import 'package:telescope_driver/model/apiModel/requestModel/login_req_model.dart';
import 'package:telescope_driver/model/apiModel/responseModel/register_res_model.dart';
import 'package:telescope_driver/utils/const_utils.dart';
import 'package:telescope_driver/utils/enum_utils.dart';
import 'package:telescope_driver/utils/pref_manager_utils.dart';
import 'package:telescope_driver/utils/validation_utils.dart';
import 'package:telescope_driver/viewmodel/auth_viewmodel.dart';
import 'package:telescope_driver/views/home/newBottomBar.dart';
import '../../widgets/drawer.dart';
import '../../utils/color_utils.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/image_utils.dart';
import '../../utils/variable_utils.dart';
import '../../widgets/CustomeTextFormFeild.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_round_button.dart';

import '../signup/SignupScreen.dart';
import 'forgot_password_screen.dart';
// import 'package:drawer_swipe/drawer_swipe.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  LoginReqModel reqModel = LoginReqModel();
  AuthViewModel viewModel = Get.find();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    reqModel.countryCode = "+1";
  }

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
                  key: _scaffoldkey,
                  backgroundColor: ColorUtils.white,
                  appBar: PreferredSize(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.w),
                      child:
                          //Text("data"),
                          CustomAppBar(
                        authName: 'Signup',
                        // backIcon: ImageUtils.backIcon,
                        // backOnTap: () {
                        //   Navigator.pop(context);
                        // },
                        locationIcon: ImageUtils.locationIcon,
                        titleName: VariableUtils.title,
                        authOnTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()));
                        },
                      ),
                    ),
                    preferredSize: Size.fromHeight(20.w),
                  ),
                  body: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  VariableUtils.login,
                                  style: FontTextStyle.GorditaW5S14darkBlack
                                      .copyWith(
                                          fontWeight: FontWeightClass.bold,
                                          fontSize: 16.sp),
                                ),
                                SizedBox(
                                  height: 3.w,
                                ),
                                Text(
                                  VariableUtils.loginDes,
                                  style: FontTextStyle.GorditaW5S10lightBlack,
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                CustomInputField(
                                  fieldName: 'Email Address',
                                  onChange: (value) {
                                    // reqModel.email = value;
                                  },
                                  inputFormat: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(RegularExpression.emailPattern))
                                  ],

                                  validator: (value) {
                                    bool regex = new RegExp(RegularExpression
                                            .emailValidationPattern)
                                        .hasMatch(value!);
                                    if (value.isEmpty) {
                                      return '* Is Required';
                                    } else if (regex == false) {
                                      return "Please Enter Valid Email";
                                    }

                                    return null;
                                  },
                                  // fieldController: _email
                                ),
                                // Text('Phone Number',
                                //     style: FontTextStyle.GorditaW7S10darkBlack),
                                //
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.end,
                                //   children: [
                                //     Expanded(
                                //       flex: 0,
                                //       child: Container(
                                //         height: 12.w,
                                //
                                //         padding: EdgeInsets.all(4.w),
                                //         decoration: BoxDecoration(
                                //           color: ColorUtils.aliceBlue,
                                //           borderRadius:
                                //               BorderRadius.circular(4.5),
                                //         ),
                                //         //margin: EdgeInsets.symmetric(horizontal: 20),
                                //         child: DropdownButton(
                                //           // isExpanded: true,
                                //           iconEnabledColor: ColorUtils.grey,
                                //           style: TextStyle(
                                //               color: ColorUtils.grey,
                                //               fontSize: 16),
                                //           dropdownColor: ColorUtils.aliceBlue,
                                //           focusColor: ColorUtils.grey,
                                //           elevation: 0,
                                //           underline: SizedBox(),
                                //           value: reqModel.countryCode,
                                //           icon: Icon(Icons.keyboard_arrow_down),
                                //           items: ConstUtils.kCountryCode
                                //               .map((String items) {
                                //             return DropdownMenuItem(
                                //               child: Text(items),
                                //               value: items != null ? items : "",
                                //             );
                                //           }).toList(),
                                //           onChanged: (value) {
                                //             setState(() {
                                //               reqModel.countryCode =
                                //                   value as String;
                                //             });
                                //           },
                                //         ),
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 2.w,
                                //     ),
                                //     Expanded(
                                //         child: CustomInputField(
                                //       onChange: (value) {
                                //         reqModel.pNumber = value;
                                //       },
                                //       inputFormat: [
                                //         FilteringTextInputFormatter.allow(
                                //             RegExp(RegularExpression
                                //                 .digitsPattern))
                                //       ],
                                //       // validator: (str) {
                                //       //   if (str!.isEmpty) {
                                //       //     return '* Is Required';
                                //       //   }
                                //       //
                                //       //   return null;
                                //       // },
                                //       fieldInputType: TextInputType.number,
                                //     )),
                                //   ],
                                // ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                CustomInputField(
                                  fieldName: 'Password',
                                  obscureText: true,
                                  maxLines: 1,
                                  onChange: (value) {
                                    reqModel.password = value;
                                  },
                                  // inputFormat: [
                                  //   FilteringTextInputFormatter.allow(
                                  //       RegExp(RegularExpression
                                  //           .alphabetPattern))
                                  // ],
                                  validator: (str) {
                                    if (str!.isEmpty) {
                                      return '* Is Required';
                                    }

                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ForgotPasswordScreen()));
                                        },
                                        child: Text(
                                          VariableUtils.forgotPassword,
                                          style: FontTextStyle
                                              .GorditaW5S12darkBlackunderline,
                                        )),
                                    CustomRoundButton(
                                      onTap: onTap,
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
                if (controller.loginApiResponse.status == Status.LOADING)
                  LoadingView.postLoadingView()
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> onTap() async {
    Get.offAll(NewBottomNavBar());

    return;
    if (formKey.currentState!.validate()) {
      if (reqModel.pNumber == null || reqModel.pNumber == '') {
        showToast(title: 'Phone number required');
        return;
      }

      await viewModel.login(reqModel);
      if (viewModel.loginApiResponse.status == Status.COMPLETE) {
        RegisterResModel response = viewModel.loginApiResponse.data;
        if (response.sucecess == true) {
          showToast(title: response.message!, status: true);

          await PrefManagerUtils.setUserData(
              jsonEncode(response.data!.toJson()));
          log('USER DATA :${PrefManagerUtils.getUserData()}');
          Get.offAll(NewBottomNavBar());
        } else {
          // showToast(title: 'Sign up failed');
          showToast(title: response.message ?? 'Login failed');
        }
      } else {
        showToast(title: VariableUtils.somethingWantWrong);
      }
    }
  }
}
