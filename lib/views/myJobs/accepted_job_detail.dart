import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/validation_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/views/home/widgets/home_appbar_custom.dart';
import 'package:telescope_driver/widgets/CustomeTextFormFeild.dart';

import '../../widgets/custombutton.dart';
import 'activejob_reachpickuplocation.dart';

class AcceptedJobDetailPage extends StatefulWidget {
  final bool showContact;

  const AcceptedJobDetailPage({Key? key, this.showContact = false})
      : super(key: key);

  @override
  State<AcceptedJobDetailPage> createState() => _AcceptedJobDetailPageState();
}

class _AcceptedJobDetailPageState extends State<AcceptedJobDetailPage> {
  int _selectedIndex = 0;

  List ls = ['All', "Furnitures", "Clothes", "Electronics"];

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
                backOnTap: () {
                  Navigator.pop(context);
                },
                authIcon: ImageUtils.insure,
                authName: 'Insured',
                chatBox: CustomButton(
                  width: 18.w,
                  height: 9.w,
                  // height: 10.w,
                  title: 'Chat',
                  textColor: ColorUtils.primaryColor,
                  backgroundColor: ColorUtils.darkBlack,
                  onPressed: () {},
                ),
              ),
            ),
            preferredSize: Size.fromHeight(17.w),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            VariableUtils.pickupdesk,
                            style: FontTextStyle.GorditaW5S14darkBlack.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 16.sp),
                          ),
                          Row(
                            children: [
                              Text(
                                VariableUtils.pickupdeskk,
                                style: FontTextStyle.GorditaW5S14darkBlack
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 0.5.w),
                                // height: 4.5.w,
                                // width: 20.w,
                                decoration: BoxDecoration(
                                    color: ColorUtils.primaryColor
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10.w)),
                                child: Center(
                                    child: Text(
                                  VariableUtils.milis,
                                  style: FontTextStyle.GorditaW5S10darkBlack,
                                )),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 0.5.w),
                                // height: 4.5.w,
                                // width: 20.w,
                                decoration: BoxDecoration(
                                    color: ColorUtils.primaryColor,
                                    borderRadius: BorderRadius.circular(10.w)),
                                child: Center(
                                    child: Text(
                                  '\$250 Bid',
                                  style: FontTextStyle.GorditaW5S10darkBlack,
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            VariableUtils.pickdatedetails,
                            style: FontTextStyle.GorditaW5S10lightBlack,
                          ),
                          Row(
                            children: [
                              Text(
                                VariableUtils.miles4,
                                style: FontTextStyle.GorditaW5S10lightBlack
                                    .copyWith(color: ColorUtils.black),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(VariableUtils.miles5,
                                  style: FontTextStyle.GorditaW5S10lightBlack),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              // backgroundColor: ColorUtils.blue,
                              backgroundImage: AssetImage(ImageUtils.profile4),
                              radius: 5.w,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  VariableUtils.customer,
                                  style: FontTextStyle.GorditaW5S10lightBlack,
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Text(
                                  VariableUtils.custName1,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(
                                          color: ColorUtils.black,
                                          fontWeight: FontWeightClass.bold),
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  VariableUtils.custPayment1,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(
                                          color: ColorUtils.black,
                                          fontWeight: FontWeightClass.bold),
                                ),
                                Text(VariableUtils.custPayment2,
                                    style:
                                        FontTextStyle.GorditaW5S10lightBlack),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.w,
                      ),

                      // Divider(),
                    ],
                  )),
                ),
                Container(
                    color: ColorUtils.primaryColor.withOpacity(0.2),
                    // height: 50,
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          SvgPicture.asset(ImageUtils.timerCircle,
                              height: 10.w),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deadline',
                                style: FontTextStyle.GorditaW5S10lightBlack,
                              ),
                              SizedBox(
                                height: 1.w,
                              ),
                              Text(
                                '3 days - Mar 2 - 3:00pm',
                                style: FontTextStyle.GorditaW5S10lightBlack
                                    .copyWith(
                                        color: ColorUtils.black,
                                        fontWeight: FontWeightClass.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 8.w,
                ),
                Column(
                  children: [
                    Container(
                      height: 9.w,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: ls.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                                print(index);
                              },
                              //   focusColor: Colors.redAccent,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: _selectedIndex == index
                                            ? Colors.transparent
                                            : ColorUtils.grey.withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(1.w),
                                    color: _selectedIndex == index
                                        ? ColorUtils.darkBlack
                                        : Colors.transparent),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.2.w),
                                        child: Text(ls[index],
                                            style: (_selectedIndex == index
                                                ? FontTextStyle
                                                        .GorditaW5S10lightBlack
                                                    .copyWith(
                                                        color: ColorUtils
                                                            .primaryColor)
                                                : FontTextStyle
                                                        .GorditaW5S10lightBlack
                                                    .copyWith(
                                                        color:
                                                            ColorUtils.black))),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: Get.width,
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                ImageUtils.sofa1,
                                height: 53.w,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 10,
                              right: 10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    ImageUtils.backWordArrow,
                                    scale: 12,
                                  ),
                                  Image.asset(
                                    ImageUtils.forwordArrow,
                                    scale: 12,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 2),
                                  child: Text(
                                    '1/1',
                                    style: TextStyle(
                                        color: ColorUtils.white, fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.w,
                ),
                Container(
                  padding: EdgeInsets.all(3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        VariableUtils.sofa,
                        style: FontTextStyle.GorditaW7S12darkBlack.copyWith(
                            fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImageUtils.horizontalline,
                                    height: 3.w,
                                    color: ColorUtils.accent,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(VariableUtils.length1,
                                      style:
                                          FontTextStyle.GorditaW5S10lightBlack
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeightClass.bold)),
                                ],
                              ),
                              SizedBox(
                                height: 1.w,
                              ),
                              Text(VariableUtils.length,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: 22.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    ImageUtils.horizontalline1,
                                    height: 4.w,
                                    color: ColorUtils.accent,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(VariableUtils.width1,
                                      style:
                                          FontTextStyle.GorditaW5S10lightBlack
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeightClass.bold)),
                                ],
                              ),
                              SizedBox(
                                height: 1.w,
                              ),
                              Text(VariableUtils.width,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(color: Colors.black)),
                            ],
                          ),
                          SizedBox(
                            width: 22.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    ImageUtils.verticalline,
                                    height: 5.w,
                                    width: 5.w,
                                    color: ColorUtils.accent,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(VariableUtils.height1,
                                      style:
                                          FontTextStyle.GorditaW5S10lightBlack
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeightClass.bold)),
                                ],
                              ),
                              SizedBox(
                                height: 1.w,
                              ),
                              Text(VariableUtils.height,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    ImageUtils.weight,
                                    height: 5.w,
                                    width: 5.w,
                                    color: ColorUtils.accent,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    VariableUtils.weight1,
                                    style: FontTextStyle.GorditaW5S10lightBlack
                                        .copyWith(
                                            color: ColorUtils.black,
                                            fontWeight: FontWeightClass.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1.w,
                              ),
                              Text(VariableUtils.weight,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    ImageUtils.charge,
                                    height: 5.w,
                                    width: 5.w,
                                    color: ColorUtils.accent,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(VariableUtils.quantity1,
                                      style:
                                          FontTextStyle.GorditaW5S10lightBlack
                                              .copyWith(
                                                  color: ColorUtils.black,
                                                  fontWeight:
                                                      FontWeightClass.bold)),
                                ],
                              ),
                              SizedBox(
                                height: 1.w,
                              ),
                              Text(VariableUtils.quantity,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(
                                    color: Colors.black,
                                  )),
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
                Divider(),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    color: ColorUtils.white,
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            VariableUtils.pickup,
                            style:
                                FontTextStyle.GorditaW5S10lightBlack.copyWith(
                                    color: ColorUtils.black,
                                    fontWeight: FontWeightClass.bold,
                                    fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                          Text(
                            VariableUtils.Pichaddress,
                            style:
                                FontTextStyle.GorditaW5S10lightBlack.copyWith(
                              fontSize: 11.sp,
                            ),
                          ),
                          SizedBox(
                            height: 1.w,
                          ),
                          Text(VariableUtils.pickdate,
                              style:
                                  FontTextStyle.GorditaW5S10lightBlack.copyWith(
                                      color: ColorUtils.black,
                                      fontWeight: FontWeightClass.bold,
                                      fontSize: 12.sp)),
                        ],
                      ),
                      if (widget.showContact)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 8.w,
                            ),
                            Container(
                              // height: 17.w,
                              decoration: BoxDecoration(
                                color: ColorUtils.primaryLight.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(3.w),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 3.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                VariableUtils.contact,
                                                style: FontTextStyle
                                                        .GorditaW5S10lightBlack
                                                    .copyWith(
                                                        color: ColorUtils.black,
                                                        fontWeight:
                                                            FontWeightClass
                                                                .bold),
                                              ),
                                              SizedBox(
                                                height: 3.w,
                                              ),
                                              Text(
                                                'Deni Codider',
                                                style: TextStyle(
                                                    fontSize: 17.sp,
                                                    fontWeight:
                                                        FontWeightClass.bold),
                                              ),
                                              SizedBox(
                                                height: 3.w,
                                              ),
                                              Text('+1 798-895-7898',
                                                  style: FontTextStyle
                                                      .GorditaW5S10lightBlack),
                                              Text(
                                                  'denicolindrer1257@email.com',
                                                  style: FontTextStyle
                                                      .GorditaW5S10lightBlack),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Material(
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                    color: ColorUtils.white,
                                                    width: 2),
                                              ),
                                              child: CircleAvatar(
                                                child: SvgPicture.asset(
                                                  ImageUtils.dialer,
                                                  height: 20,
                                                  color: ColorUtils.black,
                                                ),
                                                backgroundColor:
                                                    ColorUtils.primaryColor,
                                                radius: 23,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Material(
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                    color: ColorUtils.white,
                                                    width: 2),
                                              ),
                                              child: SvgPicture.asset(
                                                ImageUtils.messageCircle,
                                                height: 55,
                                                // color: ColorUtils.black,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.w,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ColorUtils.white,
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: 'Note:  ',
                                          style: FontTextStyle
                                              .GorditaW5S10lightBlack,
                                        ),
                                        TextSpan(
                                            text:
                                                'ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                                            style: FontTextStyle
                                                    .GorditaW7S10darkBlack
                                                .copyWith())
                                      ])),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.w,
                ),
                Container(
                  padding: EdgeInsets.all(3.w),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  color: ColorUtils.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        VariableUtils.Dropofftitle,
                        style: FontTextStyle.GorditaW5S10lightBlack.copyWith(
                            color: ColorUtils.black,
                            fontWeight: FontWeightClass.bold,
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 2.w,
                      ),
                      Text(
                        VariableUtils.dropoffaddress,
                        style: FontTextStyle.GorditaW5S10lightBlack.copyWith(
                          fontSize: 11.sp,
                        ),
                      ),
                      SizedBox(
                        height: 1.w,
                      ),
                      Text(
                        VariableUtils.dropoffdate,
                        style: FontTextStyle.GorditaW5S10lightBlack.copyWith(
                            color: ColorUtils.black,
                            fontWeight: FontWeightClass.bold,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.w,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Delivery Status',
                    style: FontTextStyle.GorditaW7S12darkBlack.copyWith(
                        fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(ImageUtils.map),
                ),
                SizedBox(
                  height: 8.w,
                ),
                Padding(
                  padding: EdgeInsets.all(3.w),
                  child: CustomButton(
                    title: 'Start Job',
                    textColor: ColorUtils.black,
                    width: double.infinity,
                    height: 50,
                    backgroundColor: ColorUtils.primaryColor,
                    onPressed: () {
                      Get.to(ActiveJobReachPickUpLocation());
                    },
                  ),
                ),
                Center(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Cancel Job',
                          style: TextStyle(
                              color: ColorUtils.red,
                              fontSize: 17,
                              fontWeight: FontWeightClass.bold),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
