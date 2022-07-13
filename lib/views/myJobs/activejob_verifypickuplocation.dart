import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';

import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:telescope_driver/views/myjobs/widgets/customhomecontainer.dart';
import 'package:telescope_driver/views/myjobs/widgets/customprofilecontainer.dart';
import '../../widgets/CustomeTextFormFeild.dart';
import '../../widgets/custombutton.dart';
import '../home/widgets/home_appbar_custom.dart';
import 'activejob_itemloaded.dart';

class ActiveJobVerifyPickUpLocation extends StatefulWidget {
  const ActiveJobVerifyPickUpLocation({Key? key}) : super(key: key);

  @override
  State<ActiveJobVerifyPickUpLocation> createState() =>
      _ActiveJobVerifyPickUpLocationState();
}

class _ActiveJobVerifyPickUpLocationState
    extends State<ActiveJobVerifyPickUpLocation>
    with SingleTickerProviderStateMixin {
  TabController? _tabs;
  int? selected;
  TextEditingController _qrcontroller = TextEditingController();
  String qrCodeRes = " ";
  String code = "";

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
                child: CustomHomeAppbar(
                  backIcon: ImageUtils.backIcon,
                  titleName: VariableUtils.activejob1,
                  backOnTap: () {
                    Navigator.pop(context);
                  },
                  authIcon: ImageUtils.appBarMsg,
                )),
            preferredSize: Size.fromHeight(15.w),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageUtils.verifyPickupMap,
                        height: 200,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                      SvgPicture.asset(
                        ImageUtils.upward,
                        height: 2.w,
                        width: 2.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.w,
                ),
                Container(
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: ColorUtils.grey.withOpacity(0.1),
                  ),
                  child: Center(
                      child: Text(
                    VariableUtils.swipeUp,
                    style: FontTextStyle.GorditaW5S10lightBlack.copyWith(
                        color: ColorUtils.black),
                  )),
                ),
                SizedBox(
                  height: 1.w,
                ),
                customprofilecontainer(),
                SizedBox(
                  height: 5.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          VariableUtils.pickupdesk,
                          style: FontTextStyle.GorditaW5S12darkBlack.copyWith(
                              fontWeight: FontWeightClass.bold,
                              fontSize: 14.sp),
                        ),
                        Row(
                          children: [
                            Text(
                              VariableUtils.pickupdeskk,
                              style:
                                  FontTextStyle.GorditaW5S12darkBlack.copyWith(
                                      fontWeight: FontWeightClass.bold,
                                      fontSize: 14.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.w,
                        ),
                        Container(
                          color: ColorUtils.white,
                          padding: EdgeInsets.all(2.w),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        VariableUtils.pickupLocation1,
                                        style:
                                            FontTextStyle.GorditaW5S10lightBlack
                                                .copyWith(
                                                    color: ColorUtils.black,
                                                    fontWeight:
                                                        FontWeightClass.bold,
                                                    fontSize: 12.sp),
                                      ),
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(2.w),
                                        decoration: BoxDecoration(
                                            color: ColorUtils.aliceBlue,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          'Feb 28 - 10:30pm',
                                          style: FontTextStyle
                                              .GorditaW5S10lightBlack.copyWith(
                                            color: ColorUtils.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        VariableUtils.PickAddress1,
                                        style: FontTextStyle
                                            .GorditaW5S10lightBlack,
                                      ),
                                      SizedBox(
                                        height: 1.w,
                                      ),
                                      Text(
                                        VariableUtils.PickAddress2,
                                        style: FontTextStyle
                                            .GorditaW5S10lightBlack,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(),
                              SizedBox(
                                height: 4.w,
                              ),
                              Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            VariableUtils.dropOffLocation1,
                                            style: FontTextStyle
                                                    .GorditaW5S10lightBlack
                                                .copyWith(
                                                    color: ColorUtils.black,
                                                    fontWeight:
                                                        FontWeightClass.bold,
                                                    fontSize: 12.sp),
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(2.w),
                                            decoration: BoxDecoration(
                                                color: ColorUtils.aliceBlue,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              'Mar 2 - 3:00pm',
                                              style: FontTextStyle
                                                      .GorditaW5S10lightBlack
                                                  .copyWith(
                                                color: ColorUtils.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            VariableUtils.dropOffAddress1,
                                            style: FontTextStyle
                                                .GorditaW5S10lightBlack,
                                          ),
                                          SizedBox(
                                            height: 1.w,
                                          ),
                                          Text(
                                            VariableUtils.dropOffAddress2,
                                            style: FontTextStyle
                                                .GorditaW5S10lightBlack,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActiveJobItemLoaded()));
                            showModalBottomSheet(
                                enableDrag: true,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return showModelBottomSuccess();
                                });
                          },
                          child: Container(
                            height: 12.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.w),
                              color: ColorUtils.white,
                              border: Border.all(color: ColorUtils.accent),
                            ),
                            child: Center(
                                child: Text(
                              'Enter Verification Code',
                              style:
                                  FontTextStyle.GorditaW5S12lightBlack.copyWith(
                                      color: ColorUtils.accent,
                                      fontWeight: FontWeightClass.bold),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showModelBottomSuccess() {
    return Container(
      height: 270,
      color: ColorUtils.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.w,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              VariableUtils.verifyPickUpCode,
              style: FontTextStyle.GorditaW5S12darkBlack.copyWith(
                  fontWeight: FontWeightClass.bold, fontSize: 14.sp),
            ),
          ),
          SizedBox(
            height: 5.w,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Enter Verification Code',
                style: FontTextStyle.GorditaW7S10darkBlack),
          ),
          SizedBox(
            height: 3.w,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Pinput(
              // defaultPinTheme: defaultPinTheme,
              // focusedPinTheme: focusedPinTheme,
              // submittedPinTheme: submittedPinTheme,
              // validator: (s) {
              //   return s == '2222' ? null : 'Pin is incorrect';
              // },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              length: 6,
              onCompleted: (pin) => print(pin),
            ),
          ),
          Spacer(),
          CustomButton(
            height: 20.w,
            width: double.infinity,
            borderRadius: 0,
            backgroundColor: ColorUtils.darkBlack,
            title: 'Done',
            textColor: ColorUtils.primaryColor,
            onPressed: () {
              Get.off(ActiveJobItemLoaded());
            },
          ),
        ],
      ),
    );
  }

  void scanCode() async {
    String res = await FlutterBarcodeScanner.scanBarcode(
        '#87CEFA', 'cancel', true, ScanMode.QR);

    print(res);
    setState(() {
      qrCodeRes = res;
      print(qrCodeRes);
    });
  }
}
