import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custombutton.dart';
import '../Message/chat_screen.dart';
import 'activejob_reachpickuplocation.dart';

class DetailPageMyHome extends StatefulWidget {
  const DetailPageMyHome({Key? key}) : super(key: key);

  @override
  State<DetailPageMyHome> createState() => _DetailPageMyHomeState();
}

class _DetailPageMyHomeState extends State<DetailPageMyHome> {
  int _selectedIndex = 0;

  List ls = ['All', "Furnitures", "Clothes", "Electronics"];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
          // appBar: PreferredSize(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         SvgPicture.asset(
          //           ImageUtils.backIcon,
          //           height: 4.w,
          //         ),
          //         SizedBox(
          //           width: 43.w,
          //         ),
          //         SvgPicture.asset(
          //           ImageUtils.insure,
          //           height: 4.w,
          //         ),
          //         SizedBox(
          //           width: 2.w,
          //         ),
          //         Text(
          //           VariableUtils.insured,
          //           style: FontTextStyle.GorditaW5S12lightBlack.copyWith(
          //               color: ColorUtils.accent),
          //         ),
          //         SizedBox(
          //           width: 4.w,
          //         ),
          //         Container(
          //           height: 8.w,
          //           width: 15.w,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(5.0),
          //               color: ColorUtils.darkBlack),
          //           child: Center(
          //               child: Text(
          //             VariableUtils.chat,
          //             style: FontTextStyle.gilroyW7S12primaryColor
          //                 .copyWith(fontSize: 10.sp),
          //           )),
          //         ),
          //       ],
          //     ),
          //   ),
          //   preferredSize: Size.fromHeight(17.w),
          // ),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(15.w), child: appBar()),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          VariableUtils.pickupdesk,
                          style: FontTextStyle.GorditaW5S12darkBlack.copyWith(
                              fontWeight: FontWeightClass.bold),
                        ),
                        Text(
                          VariableUtils.pickupdeskk,
                          style: FontTextStyle.GorditaW5S12darkBlack.copyWith(
                              fontWeight: FontWeightClass.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              VariableUtils.pickdatedetails,
                              style: FontTextStyle.GorditaW5S12lightBlack,
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            Row(
                              children: [
                                Text(
                                  VariableUtils.miles4,
                                  style: FontTextStyle.GorditaW5S12lightBlack
                                      .copyWith(color: ColorUtils.black),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(VariableUtils.miles5,
                                    style:
                                        FontTextStyle.GorditaW5S12lightBlack),
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 4.w,
                        ),
                        Container(
                          // color: ColorUtils.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    // backgroundColor: ColorUtils.blue,
                                    backgroundImage:
                                        AssetImage(ImageUtils.profile4),
                                    radius: 6.w,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        VariableUtils.customer,
                                        style: FontTextStyle
                                            .GorditaW5S10lightBlack,
                                      ),
                                      Text(
                                        VariableUtils.custName1,
                                        style:
                                            FontTextStyle.GorditaW5S10lightBlack
                                                .copyWith(
                                                    color: ColorUtils.black,
                                                    fontWeight:
                                                        FontWeightClass.bold),
                                      ),
                                      SizedBox(
                                        height: 1.w,
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   width: 23.w,
                                  // ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        VariableUtils.custPayment1,
                                        style:
                                            FontTextStyle.GorditaW5S10lightBlack
                                                .copyWith(
                                                    color: ColorUtils.black,
                                                    fontWeight:
                                                        FontWeightClass.bold),
                                      ),
                                      Text(
                                        VariableUtils.custPayment2,
                                        style: FontTextStyle
                                            .GorditaW5S10lightBlack,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 18.w,
                  decoration: BoxDecoration(
                    color: ColorUtils.primaryLight,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Center(
                            child: SvgPicture.asset(
                              ImageUtils.timer1,
                              height: 5.w,
                            ),
                          ),
                          backgroundColor: ColorUtils.primaryColor,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              VariableUtils.deadline,
                              style: FontTextStyle.GorditaW5S10lightBlack,
                            ),
                            Text(
                              VariableUtils.days1,
                              style:
                                  FontTextStyle.GorditaW5S10lightBlack.copyWith(
                                      color: ColorUtils.black,
                                      fontWeight: FontWeightClass.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                  child: Container(
                    child: Column(
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 1.5.w),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: _selectedIndex == index
                                                ? Colors.transparent
                                                : ColorUtils.grey
                                                    .withOpacity(0.2)),
                                        borderRadius:
                                            BorderRadius.circular(1.w),
                                        color: _selectedIndex == index
                                            ? ColorUtils.darkBlack
                                            : Colors.transparent),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.2.w),
                                            child: Text(ls[index],
                                                style: (_selectedIndex == index
                                                    ? FontTextStyle
                                                            .GorditaW7S12darkBlack
                                                        .copyWith(
                                                            color: ColorUtils
                                                                .primaryColor)
                                                    : FontTextStyle
                                                            .GorditaW5S10lightBlack
                                                        .copyWith(
                                                            color: ColorUtils
                                                                .black))),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageUtils.sofa1,
                              height: 53.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              VariableUtils.sofa,
                              style: FontTextStyle.GorditaW7S12darkBlack,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.w,
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
                                                .copyWith(color: Colors.black)),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Text(VariableUtils.length,
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
                                                .copyWith(color: Colors.black)),
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
                                                .copyWith(color: Colors.black)),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Text(VariableUtils.height,
                                    style: FontTextStyle.GorditaW5S10lightBlack
                                        .copyWith(color: Colors.black)),
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
                                      style: FontTextStyle
                                              .GorditaW5S10lightBlack
                                          .copyWith(color: ColorUtils.black),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Text(VariableUtils.weight,
                                    style: FontTextStyle.GorditaW5S10lightBlack
                                        .copyWith(color: Colors.black)),
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
                                        style: FontTextStyle
                                                .GorditaW5S10lightBlack
                                            .copyWith(color: ColorUtils.black)),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Text(VariableUtils.quantity,
                                    style: FontTextStyle.GorditaW5S10lightBlack
                                        .copyWith(color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 5.w,
                        ),
                        Container(
                          padding: EdgeInsets.all(2.w),
                          color: ColorUtils.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 3.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      VariableUtils.pickup,
                                      style: FontTextStyle
                                              .GorditaW5S10lightBlack
                                          .copyWith(
                                              color: ColorUtils.black,
                                              fontWeight: FontWeightClass.bold),
                                    ),
                                    SizedBox(
                                      height: 2.w,
                                    ),
                                    Text(
                                      VariableUtils.Pichaddress,
                                      style: FontTextStyle
                                          .GorditaW5S10lightBlack.copyWith(
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.w,
                                    ),
                                    Text(
                                      VariableUtils.pickdate,
                                      style: FontTextStyle
                                              .GorditaW5S10lightBlack
                                          .copyWith(
                                              color: ColorUtils.black,
                                              fontWeight: FontWeightClass.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8.w,
                              ),
                              Container(
                                height: 17.w,
                                decoration: BoxDecoration(
                                  color:
                                      ColorUtils.primaryLight.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(3.w),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 3.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        VariableUtils.contact,
                                        style: FontTextStyle
                                            .GorditaW5S10lightBlack.copyWith(
                                          color: ColorUtils.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                ImageUtils.bottomprofile,
                                                height: 4.w,
                                                width: 4.w,
                                                color: ColorUtils.black
                                                    .withOpacity(0.7),
                                              ),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              Text(VariableUtils.deni,
                                                  style: FontTextStyle
                                                      .GorditaW5S10lightBlack),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                ImageUtils.dialer,
                                                height: 4.w,
                                                width: 4.w,
                                                color: ColorUtils.black
                                                    .withOpacity(0.7),
                                              ),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              Text(VariableUtils.contactDeni,
                                                  style: FontTextStyle
                                                      .GorditaW5S10lightBlack),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      CircleAvatar(
                                        child: SvgPicture.asset(
                                          ImageUtils.dialer,
                                          height: 5.w,
                                          color: ColorUtils.black,
                                        ),
                                        backgroundColor:
                                            ColorUtils.primaryColor,
                                        radius: 5.w,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.w,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomButton(
                                    width: 27.w,
                                    height: 9.w,
                                    title: "See Note",
                                    textStyle:
                                        FontTextStyle.GorditaW7S10darkBlack,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Container(
                          color: ColorUtils.white,
                          padding: EdgeInsets.all(2.w),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 3.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  VariableUtils.Dropofftitle,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(
                                          color: ColorUtils.black,
                                          fontWeight: FontWeightClass.bold),
                                ),
                                SizedBox(
                                  height: 2.w,
                                ),
                                Text(
                                  VariableUtils.dropoffaddress,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(
                                    fontSize: 11.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Text(
                                  VariableUtils.dropoffdate,
                                  style: FontTextStyle.GorditaW5S10lightBlack
                                      .copyWith(
                                          color: ColorUtils.black,
                                          fontWeight: FontWeightClass.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              VariableUtils.statusYourJob,
                              style:
                                  FontTextStyle.GorditaW5S12darkBlack.copyWith(
                                      fontWeight: FontWeightClass.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Stack(
                          children: [
                            SvgPicture.asset(
                              ImageUtils.statusYourJob1,
                              height: 70.w,
                              width: 80.w,
                            ),
                            SvgPicture.asset(
                              ImageUtils.statusYourJobMap,
                              height: 50.w,
                              width: 80.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        CustomButton(
                          // height: 20.w,
                          width: double.infinity,
                          backgroundColor: ColorUtils.primaryColor,
                          title: VariableUtils.outForDelivery,
                          textColor: ColorUtils.darkBlack,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ActiveJobReachPickUpLocation()));
                          },
                        ),
                        SizedBox(
                          height: 6.w,
                        ),
                        Text(
                          VariableUtils.cancelJob,
                          style: FontTextStyle.GorditaW5S12lightBlack.copyWith(
                              color: ColorUtils.red,
                              fontWeight: FontWeightClass.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
      color: ColorUtils.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.only(right: 2.w),
                  child: SvgPicture.asset(
                    ImageUtils.backIcon,
                    height: 4.5.w,
                    color: ColorUtils.black,
                  ),
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    ImageUtils.insure,
                    height: 4.w,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    VariableUtils.insured,
                    style: FontTextStyle.GorditaW5S12lightBlack.copyWith(
                        color: ColorUtils.accent),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessageChatScreen()));
                    },
                    child: Container(
                      height: 8.w,
                      width: 15.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: ColorUtils.darkBlack),
                      child: Center(
                          child: Text(
                        VariableUtils.chat,
                        style: FontTextStyle.gilroyW7S12primaryColor
                            .copyWith(fontSize: 10.sp),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
