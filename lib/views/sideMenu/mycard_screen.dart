import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:telescope_driver/widgets/CustomeTextFormFeild.dart';
import 'package:telescope_driver/widgets/custombutton.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
            child: Container(
              height: 50.w,
              width: 80.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Container(
                      height: 30.w,
                      width: 100.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            ImageUtils.colorimage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.more_horiz,
                                size: 40,
                                color: ColorUtils.white,
                              ),
                            ),
                            Text(
                              "Deni Colidar",
                              style: FontTextStyle.gilroyW720sp7white,
                            ),
                            Text(
                              "**** **** **** 2050",
                              style: FontTextStyle.gilroyW715sp7white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 20.w,
                      width: 100.w,
                      color: ColorUtils.grey.withOpacity(0.2),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              ImageUtils.visaimage,
                              scale: 1.5.w,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  "05/25",
                                  style: FontTextStyle.gilroyW7S14darkBlack,
                                ),
                                Text(
                                  "Exp. date",
                                  style: FontTextStyle.gilroyW7S14darkBlack,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorUtils.white,
      elevation: 1,
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: SvgPicture.asset(
              ImageUtils.backIcon,
              color: ColorUtils.black,
            ),
          )),
      title: Text(
        VariableUtils.myCard,
        style: FontTextStyle.GorditaW7S12darkBlack.copyWith(fontSize: 14.sp),
      ),
      actions: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                DebitCreditCardBottomSheet();
              },
              child: CustomButton(
                height: 10.w,
                width: 70,
                title: "Add",
              ),
            ),
          ],
        ),
        SizedBox(
          width: 5.w,
        ),
      ],
      centerTitle: true,
    );
  }

  void DebitCreditCardBottomSheet() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                "Credit/Debit Card",
                style: FontTextStyle.gilroyW7S14darkBlack,
              ),
            ),
            SizedBox(
              height: 4.w,
            ),
            Container(
              height: 13.w,
              width: 100.w,
              color: ColorUtils.accent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 4.w,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      ImageUtils.chargeIcon,
                      scale: 2.w,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "We will charge \$1 to ensure card is active\.",
                    style: FontTextStyle.gilroyW710sp7white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CustomInputField(
                fieldName: 'Card number',
              ),
            ),
            SizedBox(
              height: 5.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Expanded(
                      child: CustomInputField(
                    fieldName: 'Exp. date',
                  )),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                      child: CustomInputField(
                    fieldName: 'Security Code',
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 5.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Container(
                    height: 7.w,
                    width: 7.w,
                    decoration: BoxDecoration(
                      color: ColorUtils.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: ColorUtils.grey.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(
                      "Save Card",
                      style: FontTextStyle.GorditaW7S10darkBlack,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CustomButton(
                height: 13.w,
                width: 180.w,
                onPressed: () {},
                title: 'Add Card',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
