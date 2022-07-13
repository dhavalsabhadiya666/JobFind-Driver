import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/validation_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';

import '../../utils/image_utils.dart';
import '../../widgets/CustomeTextFormFeild.dart';
import '../../widgets/custombutton.dart';
import '../Message/Widgets/custome_appbar.dart';

import '../home/widgets/home_appbar_custom.dart';
import 'feedback_screen.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BankDetailsScreen> createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  String dropdownvalue = 'Bank of America';
  var bankname = [
    "Bank of America",
    "Bank of America",
    "Bank of America",
    "Bank of America",
    "Bank of America",
  ];

  // TextEditingController _phone = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _accountnum = TextEditingController();
  TextEditingController _confirm = TextEditingController();
  TextEditingController _ifsc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorUtils.white,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(15.w),
              child: Container(
                color: ColorUtils.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
                  child: Column(
                    children: [
                      CustomHomeAppbar(
                        backIcon: ImageUtils.backIcon,
                        titleName: VariableUtils.bankDetails,
                        backOnTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              )),
          bottomNavigationBar: CustomButton(
              height: 20.w,
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: ColorUtils.darkBlack,
              title: 'Verify'),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(color: ColorUtils.accent),
                  child: Text(
                    VariableUtils.bankdetailsnote,
                    style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                        color: ColorUtils.white),
                  ),
                ),
                SizedBox(
                  height: 5.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        VariableUtils.yourbank,
                        style: FontTextStyle.GorditaW7S10darkBlack,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Color(0xffF6F8FA)),
                        child: DropdownButton(
                            // value: dropdownvalue,
                            isExpanded: true,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            dropdownColor: ColorUtils.aliceBlue,
                            focusColor: ColorUtils.grey,
                            elevation: 0,
                            underline: SizedBox(),
                            items: bankname.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newvalue) {
                              setState(() {
                                dropdownvalue = newvalue!;
                              });
                            }),
                      ),
                      // SizedBox(
                      //   height: 4.w,
                      // ),
                      // CustomInputField(
                      //   fieldController: _name,
                      //   fieldName: 'Registered name in bank',
                      // ),
                      SizedBox(
                        height: 4.w,
                      ),
                      CustomInputField(
                        fieldController: _accountnum,
                        fieldName: 'Bank account number',
                        obscureText: true,
                        maxLines: 1,
                        fieldInputType: TextInputType.number,
                        inputFormat: [
                          FilteringTextInputFormatter.allow(
                              RegExp(RegularExpression.digitsPattern))
                        ],
                        validator: (str) {
                          if (str!.isEmpty) {
                            return '* Is Required';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      CustomInputField(
                        fieldController: _confirm,
                        fieldName: 'Confirm bank account number',
                        fieldInputType: TextInputType.number,
                        inputFormat: [
                          FilteringTextInputFormatter.allow(
                              RegExp(RegularExpression.digitsPattern))
                        ],
                        validator: (str) {
                          if (str!.isEmpty) {
                            return '* Is Required';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      CustomInputField(
                        fieldController: _ifsc,
                        fieldName: 'Bank routing number',
                        validator: (str) {
                          if (str!.isEmpty) {
                            return '* Is Required';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
