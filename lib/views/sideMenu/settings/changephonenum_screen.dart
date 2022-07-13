import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/const_utils.dart';
import 'package:telescope_driver/utils/validation_utils.dart';
import 'package:telescope_driver/views/signup/OTP_VerificationScreen.dart';
import 'package:telescope_driver/widgets/CustomeTextFormFeild.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/enum_utils.dart';
import '../../../utils/font_style_utils.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/variable_utils.dart';
import '../../../widgets/custombutton.dart';
import '../../Message/Widgets/custome_appbar.dart';
import '../widgets/custometextformfeild.dart';

class ChangePhoneNumberScreen extends StatefulWidget {
  const ChangePhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<ChangePhoneNumberScreen> createState() =>
      _ChangePhoneNumberScreenState();
}

class _ChangePhoneNumberScreenState extends State<ChangePhoneNumberScreen> {
  TextEditingController _oldPhNumberController = TextEditingController();
  TextEditingController _newPhNumberController = TextEditingController();

  String initialValue = '+1';
  String oldPNumberCountryCode = "+1";
  String newPNumberCountryCode = "+1";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: SizedBox(
            height: 11.w,
            width: 45.w,
            child: FloatingActionButton(
                elevation: 0.0,
                autofocus: false,
                // shape: BeveledRectangleBorder(
                //     borderRadius: BorderRadius.circular(1.w)),
                onPressed: () {},
                child: CustomButton(
                  onPressed: () {
                    // Get.to(OTPVarification(
                    //   // userId: userId ?? '11',
                    //   otp: '1111',
                    //   pNumber: '1234567890',
                    // ));
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => OTPVerificationScreen()));
                  },
                  title: "Verification Code",
                  width: 50.w,
                  backgroundColor: ColorUtils.primaryColor,
                  textColor: ColorUtils.black,
                )),
          ),
          backgroundColor: ColorUtils.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(15.w),
            child: CustomSettingAppBar(
              backIcon: ImageUtils.backIcon,
              isShadow: true,
              titleName: 'Change Phone Number',
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
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Old Phone Number',
                            style: FontTextStyle.GorditaW7S10darkBlack),
                        SizedBox(
                          height: 2.w,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 0,
                              child: Container(
                                height: 12.w,
                                padding: EdgeInsets.all(4.w),
                                decoration: BoxDecoration(
                                  color: ColorUtils.aliceBlue,
                                  borderRadius: BorderRadius.circular(4.5),
                                ),
                                //margin: EdgeInsets.symmetric(horizontal: 20),
                                child: DropdownButton(
                                  // isExpanded: true,
                                  iconEnabledColor: ColorUtils.grey,
                                  style: TextStyle(
                                      color: ColorUtils.grey, fontSize: 16),
                                  dropdownColor: ColorUtils.aliceBlue,
                                  focusColor: ColorUtils.grey,
                                  elevation: 0,
                                  underline: SizedBox(),
                                  value: oldPNumberCountryCode,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: ConstUtils.kCountryCode
                                      .map((String items) {
                                    return DropdownMenuItem(
                                      child: Text(items),
                                      value: items != null ? items : "",
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    print('VALUE :$value');

                                    setState(() {
                                      oldPNumberCountryCode = value as String;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                                child: CustomInputField(
                              // fieldController: _phone,
                              fieldInputType: TextInputType.number,
                              onChange: (value) {
                                // reqModel.pNumber = value;
                              },
                              inputFormat: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(RegularExpression.digitsPattern))
                              ],
                              // validator: (str) {
                              //   if (str!.isEmpty) {
                              //     return '* Is Required';
                              //   }
                              //
                              //   return null;
                              // },
                            )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('New Phone Number',
                            style: FontTextStyle.GorditaW7S10darkBlack),
                        SizedBox(
                          height: 2.w,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 0,
                              child: Container(
                                height: 12.w,
                                padding: EdgeInsets.all(4.w),
                                decoration: BoxDecoration(
                                  color: ColorUtils.aliceBlue,
                                  borderRadius: BorderRadius.circular(4.5),
                                ),
                                //margin: EdgeInsets.symmetric(horizontal: 20),
                                child: DropdownButton(
                                  // isExpanded: true,
                                  iconEnabledColor: ColorUtils.grey,
                                  style: TextStyle(
                                      color: ColorUtils.grey, fontSize: 16),
                                  dropdownColor: ColorUtils.aliceBlue,
                                  focusColor: ColorUtils.grey,
                                  elevation: 0,
                                  underline: SizedBox(),
                                  value: newPNumberCountryCode,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: ConstUtils.kCountryCode
                                      .map((String items) {
                                    return DropdownMenuItem(
                                      child: Text(items),
                                      value: items != null ? items : "",
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    print('VALUE :$value');

                                    setState(() {
                                      newPNumberCountryCode = value as String;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                                child: CustomInputField(
                              // fieldController: _phone,
                              fieldInputType: TextInputType.number,
                              onChange: (value) {
                                // reqModel.pNumber = value;
                              },
                              inputFormat: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(RegularExpression.digitsPattern))
                              ],
                              // validator: (str) {
                              //   if (str!.isEmpty) {
                              //     return '* Is Required';
                              //   }
                              //
                              //   return null;
                              // },
                            )),
                          ],
                        ),
                      ],
                    ),
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
