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

class CompletedJobDetailPage extends StatefulWidget {
  // final bool showContact;

  // const CompletedJobDetailPage({Key? key, this.showContact = false})
  //     : super(key: key);

  @override
  State<CompletedJobDetailPage> createState() => _CompletedJobDetailPageState();
}

class _CompletedJobDetailPageState extends State<CompletedJobDetailPage> {
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
                          Text(
                            VariableUtils.pickupdeskk,
                            style: FontTextStyle.GorditaW5S14darkBlack.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 16.sp),
                          ),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Completed',
                            style: TextStyle(
                                color: ColorUtils.accent,
                                fontSize: 12.sp,
                                fontWeight: FontWeightClass.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            VariableUtils.pickdatedetails,
                            style: FontTextStyle.GorditaW5S10lightBlack,
                          ),
                          Spacer(),
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
                Divider(),
                SizedBox(
                  height: 5.w,
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
                                                          FontWeightClass.bold),
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
                                            Text('denicolindrer1257@email.com',
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
                                              .GorditaW7S10darkBlack.copyWith())
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Review',
                        style: FontTextStyle.GorditaW7S12darkBlack.copyWith(
                            fontSize: 16.sp),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorUtils.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'Edit',
                            style: FontTextStyle.GorditaW5S10lightBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.w,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorUtils.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: ColorUtils.grey.withOpacity(0.2),
                            blurRadius: 20,
                            spreadRadius: 2),
                      ]),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              // backgroundColor: ColorUtils.blue,
                              backgroundImage: AssetImage(ImageUtils.profile3),
                              radius: 5.w,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Keto Holica',
                                  style: TextStyle(
                                      fontWeight: FontWeightClass.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  '7 Dec 2021, 13:55 UTC',
                                  style: TextStyle(
                                      fontWeight: FontWeightClass.bold,
                                      fontSize: 12,
                                      color: ColorUtils.lightBlack),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color:
                                      ColorUtils.primaryLight.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Row(
                                // mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: ColorUtils.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Text(
                            'This place gets you in and out pretty quickly if you have your BOL ready and are polite to the guy at the gate.'),
                        SizedBox(
                          height: 3.w,
                        ),
                        InkWell(
                          onTap: () {
                            Get.dialog(Dialog(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 5.w),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Hi Deni',
                                      style: TextStyle(
                                          fontWeight: FontWeightClass.bold,
                                          color: ColorUtils.grey,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      'Share your experience! Let us know how it went with your customer!',
                                      style: TextStyle(
                                          fontWeight: FontWeightClass.bold,
                                          color: ColorUtils.black,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    CustomButton(
                                      width: 35.w,
                                      height: 12.w,
                                      // height: 10.w,
                                      title: 'Give Review',
                                      textColor: ColorUtils.primaryColor,
                                      backgroundColor: ColorUtils.darkBlack,
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ));
                          },
                          child: Text(
                            'See full Review',
                            style: TextStyle(
                                color: ColorUtils.accent,
                                fontWeight: FontWeightClass.semiB,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.1),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(5))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          ImageUtils.thankyou,
                          height: 3.w,
                        ),
                        Text(
                          'Thank You',
                          style: FontTextStyle.GorditaW7S10darkBlack,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          '@Deni Olgamo',
                          style: FontTextStyle.GorditaW5S10lightBlack,
                        )
                      ],
                    )),
                SizedBox(
                  height: 3.w,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
