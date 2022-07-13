import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/viewmodel/bottom_bar_viewmodel.dart';

import '../../widgets/drawer.dart';

import '../../widgets/custombutton.dart';
import '../Message/Widgets/custome_appbar.dart';
import 'Home Detail.dart';
import 'filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  final _bottomBarViewModel = Get.find<BottomBarViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        backgroundColor: ColorUtils.aliceBlue,
        // drawer: UserDrawer(),
        // appBar: PreferredSize(
        //   child: Padding(
        //     padding: EdgeInsets.all(4.w),
        //     child: CustomHomeAppbar(
        //       backIcon: ImageUtils.menu,
        //       backOnTap: () {
        //         _scaffoldkey.currentState!.openDrawer();
        //       },
        //       titleName: VariableUtils.home,
        //       authIcon: ImageUtils.endmenu,
        //       authOnTap: () {},
        //     ),
        //   ),
        //   preferredSize: Size.fromHeight(18.w),
        // ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(15.w),
          child: CustomSettingAppBar(
            backIcon: ImageUtils.menu,
            backOnTap: () {
              // _scaffoldkey.currentState!.openDrawer();
              _bottomBarViewModel.setIsDrawerVisible();
            },
            titleName: 'Home',
            onLikeTap: () {},
            otherIcon: ImageUtils.endmenu,
            otherTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FilterBy()));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
            child: Column(
              children: [
                Container(
                  // color: ColorUtils.white,
                  // color: Color(0xffEAFDE6),
                  decoration: BoxDecoration(
                      color: Color(0xffEAFDE6),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 2.w),
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 3.w,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Posted on ',
                                      style:
                                          FontTextStyle.GorditaW5S10lightBlack,
                                    ),
                                    TextSpan(
                                        text: 'Jan 23 - 11:10pm',
                                        style: FontTextStyle
                                            .GorditaW7S10darkBlack.copyWith())
                                  ])),

                                  // Text(
                                  //   VariableUtils.pickdatedetails,
                                  //   style: FontTextStyle.GorditaW5S12lightBlack
                                  //       .copyWith(fontSize: 10.sp),
                                  // ),
                                  Container(
                                    height: 9.w,
                                    width: 9.w,
                                    decoration: BoxDecoration(
                                      color: ColorUtils.lightRed,
                                      borderRadius: BorderRadius.circular(3.sp),
                                    ),
                                    child: Center(
                                        child: Icon(
                                      Icons.favorite,
                                      color: ColorUtils.red,
                                      size: 18,
                                    )
                                        // SvgPicture.asset(
                                        //   ImageUtils.like,
                                        //   height: 4.w,
                                        //   color: ColorUtils.white,
                                        // ),
                                        ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 3.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    VariableUtils.pickupdesk,
                                    style: FontTextStyle.GorditaW5S12darkBlack
                                        .copyWith(
                                            fontWeight: FontWeightClass.bold,
                                            fontSize: 14.sp),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        VariableUtils.pickupdeskk,
                                        style:
                                            FontTextStyle.GorditaW5S12darkBlack
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeightClass.bold,
                                                    fontSize: 14.sp),
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
                                            color: ColorUtils.white,
                                            borderRadius:
                                                BorderRadius.circular(10.w)),
                                        child: Center(
                                            child: Text(
                                          VariableUtils.milis,
                                          style: FontTextStyle
                                              .GorditaW5S10darkBlack,
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
                                            borderRadius:
                                                BorderRadius.circular(10.w)),
                                        child: Center(
                                            child: Text(
                                          '\$250 Bid',
                                          style: FontTextStyle
                                              .GorditaW5S10darkBlack,
                                        )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.w,
                              ),

                              Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  ColorUtils.primaryColor,
                                              radius: 5,
                                            ),
                                            Container(
                                              height: 90,
                                              child: Column(
                                                children: List.generate(
                                                  10,
                                                  (ii) => Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 3,
                                                          bottom: 3),
                                                      child: Container(
                                                        height: 3,
                                                        width: 2,
                                                        color: Colors.grey,
                                                      )),
                                                ),
                                              ),
                                            ),
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.withOpacity(.5),
                                              radius: 5,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: LayoutBuilder(
                                                  builder:
                                                      (context, constraint) {
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          VariableUtils.pickup,
                                                          style: FontTextStyle
                                                                  .GorditaW5S10lightBlack
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeightClass
                                                                          .bold),
                                                        ),
                                                        Text(
                                                          VariableUtils
                                                              .Pichaddress,
                                                          style: FontTextStyle
                                                                  .GorditaW5S10lightBlack
                                                              .copyWith(
                                                            fontSize: 11.sp,
                                                          ),
                                                        ),
                                                        Text(
                                                          VariableUtils
                                                              .pickdate,
                                                          style: FontTextStyle
                                                                  .GorditaW5S10lightBlack
                                                              .copyWith(
                                                                  color: ColorUtils
                                                                      .black
                                                                      .withOpacity(
                                                                          0.5)),
                                                        ),
                                                        SizedBox(
                                                          height: 8.w,
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                VariableUtils
                                                                    .Dropofftitle,
                                                                style: FontTextStyle
                                                                        .GorditaW5S10lightBlack
                                                                    .copyWith(
                                                                        fontWeight:
                                                                            FontWeightClass.bold),
                                                              ),
                                                              Text(
                                                                VariableUtils
                                                                    .dropoffaddress,
                                                                style: FontTextStyle
                                                                        .GorditaW5S10lightBlack
                                                                    .copyWith(
                                                                  fontSize:
                                                                      11.sp,
                                                                ),
                                                              ),
                                                              Text(
                                                                VariableUtils
                                                                    .dropoffdate,
                                                                style: FontTextStyle
                                                                        .GorditaW5S10lightBlack
                                                                    .copyWith(
                                                                        color: ColorUtils
                                                                            .black
                                                                            .withOpacity(0.5)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Row(
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       children: [
                              //         SvgPicture.asset(
                              //           ImageUtils.dot,
                              //           height: 2.w,
                              //         ),
                              //         SizedBox(
                              //           width: 5.w,
                              //         ),
                              //         Text(
                              //           VariableUtils.pickup,
                              //           style: FontTextStyle
                              //               .GorditaW5S10lightBlack,
                              //         ),
                              //       ],
                              //     ),
                              //     SizedBox(
                              //       height: 2.w,
                              //     ),
                              //     Padding(
                              //       padding:
                              //           EdgeInsets.symmetric(horizontal: 6.5.w),
                              //       child: Text(
                              //         VariableUtils.Pichaddress,
                              //         style:
                              //             FontTextStyle.GorditaW5S10lightBlack,
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       height: 1.w,
                              //     ),
                              //     Padding(
                              //       padding:
                              //           EdgeInsets.symmetric(horizontal: 6.5.w),
                              //       child: Text(
                              //         VariableUtils.pickdate,
                              //         style:
                              //             FontTextStyle.GorditaW5S10lightBlack
                              //                 .copyWith(
                              //                     color: ColorUtils.black
                              //                         .withOpacity(0.5)),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 7.w,
                              // ),
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Row(
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       children: [
                              //         SvgPicture.asset(
                              //           ImageUtils.dot,
                              //           height: 2.w,
                              //         ),
                              //         SizedBox(
                              //           width: 5.w,
                              //         ),
                              //         Text(
                              //           VariableUtils.Dropofftitle,
                              //           style: FontTextStyle
                              //               .GorditaW5S10lightBlack,
                              //         ),
                              //       ],
                              //     ),
                              //     SizedBox(
                              //       height: 2.w,
                              //     ),
                              //     Padding(
                              //       padding:
                              //           EdgeInsets.symmetric(horizontal: 6.5.w),
                              //       child: Text(
                              //         VariableUtils.dropoffaddress,
                              //         style:
                              //             FontTextStyle.GorditaW5S10lightBlack,
                              //       ),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Divider(
                        color: ColorUtils.black,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.00),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 1.w,
                            ),
                            Stack(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              children: [
                                CircleAvatar(
                                  // backgroundColor: ColorUtils.blue,
                                  backgroundImage:
                                      AssetImage(ImageUtils.profile3),
                                  radius: 5.w,
                                ),
                                Positioned(
                                  bottom: -5,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                        color: ColorUtils.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.symmetric(vertical: 1),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 12,
                                          color: ColorUtils.black,
                                        ),
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.w),
                                  child: Text(
                                    VariableUtils.custName,
                                    style: FontTextStyle.GorditaW5S10lightBlack,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.w),
                                  child: Text(
                                    'Lippy Sukodu',
                                    style: FontTextStyle.GorditaW7S10darkBlack,
                                  ),
                                ),
                                // Container(
                                //   padding: EdgeInsets.all(1.w),
                                //   // height: 6.w,
                                //   // width: 35.w,
                                //   decoration: BoxDecoration(
                                //       color: ColorUtils.lightBlack
                                //           .withOpacity(0.07),
                                //       borderRadius:
                                //           BorderRadius.circular(10.w)),
                                //   child: Center(
                                //     child: Text(
                                //       VariableUtils.custPayment,
                                //       style: FontTextStyle
                                //               .GorditaW5S10lightBlack
                                //           .copyWith(color: ColorUtils.black),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            Spacer(),
                            CustomButton(
                              width: 32.w,
                              height: 10.w,
                              // height: 10.w,
                              title: 'Get Details',
                              textColor: Color(0xffEAFDE6),
                              backgroundColor: ColorUtils.darkBlack,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomeDetailPage()));
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7.w,
                ),
                Container(
                  // color: ColorUtils.white,

                  decoration: BoxDecoration(
                      color: Color(0xff8AC7FF).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 2.w),
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 3.w,
                          ),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xff250BE5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      child: Text(
                                        'New',
                                        style: TextStyle(
                                            color: ColorUtils.white,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Posted on ',
                                      style:
                                          FontTextStyle.GorditaW5S10lightBlack,
                                    ),
                                    TextSpan(
                                        text: 'Jan 23 - 11:10pm',
                                        style: FontTextStyle
                                            .GorditaW7S10darkBlack.copyWith())
                                  ])),
                                  Spacer(),
                                  Container(
                                    height: 9.w,
                                    width: 9.w,
                                    decoration: BoxDecoration(
                                      color: ColorUtils.white,
                                      borderRadius: BorderRadius.circular(3.sp),
                                    ),
                                    child: Center(
                                        child: Icon(
                                      Icons.favorite_border,
                                      color: ColorUtils.black,
                                      size: 18,
                                    )
                                        // SvgPicture.asset(
                                        //   ImageUtils.like,
                                        //   height: 4.w,
                                        //   color: ColorUtils.white,
                                        // ),
                                        ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 3.w,
                              ),
                              Wrap(
                                // crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                alignment: WrapAlignment.start,
                                spacing: 10,

                                children: [
                                  Text(
                                    'Teleport my Sofaset from Tagıyev dalan',
                                    style: FontTextStyle.GorditaW5S12darkBlack
                                        .copyWith(
                                            fontWeight: FontWeightClass.bold,
                                            fontSize: 14.sp),
                                  ),
                                  Container(
                                    width: 90,
                                    height: 25,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 0.5.w),
                                    // height: 4.5.w,
                                    // width: 20.w,
                                    decoration: BoxDecoration(
                                        color: ColorUtils.white,
                                        borderRadius:
                                            BorderRadius.circular(10.w)),
                                    child: Center(
                                        child: Text(
                                      '24 miles',
                                      style:
                                          FontTextStyle.GorditaW5S10darkBlack,
                                    )),
                                  ),
                                  Container(
                                    width: 90,
                                    height: 25,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 0.5.w),
                                    // height: 4.5.w,
                                    // width: 20.w,
                                    decoration: BoxDecoration(
                                        color: ColorUtils.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10.w)),
                                    child: Center(
                                        child: Text(
                                      '\$250 Bid',
                                      style:
                                          FontTextStyle.GorditaW5S10darkBlack,
                                    )),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 5.w,
                              ),

                              Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  ColorUtils.primaryColor,
                                              radius: 5,
                                            ),
                                            Container(
                                              height: 90,
                                              child: Column(
                                                children: List.generate(
                                                  10,
                                                  (ii) => Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 3,
                                                          bottom: 3),
                                                      child: Container(
                                                        height: 3,
                                                        width: 2,
                                                        color: Colors.grey,
                                                      )),
                                                ),
                                              ),
                                            ),
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.withOpacity(.5),
                                              radius: 5,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: LayoutBuilder(
                                                  builder:
                                                      (context, constraint) {
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          VariableUtils.pickup,
                                                          style: FontTextStyle
                                                                  .GorditaW5S10lightBlack
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeightClass
                                                                          .bold),
                                                        ),
                                                        Text(
                                                          VariableUtils
                                                              .Pichaddress,
                                                          style: FontTextStyle
                                                                  .GorditaW5S10lightBlack
                                                              .copyWith(
                                                            fontSize: 11.sp,
                                                          ),
                                                        ),
                                                        Text(
                                                          VariableUtils
                                                              .pickdate,
                                                          style: FontTextStyle
                                                                  .GorditaW5S10lightBlack
                                                              .copyWith(
                                                                  color: ColorUtils
                                                                      .black
                                                                      .withOpacity(
                                                                          0.5)),
                                                        ),
                                                        SizedBox(
                                                          height: 8.w,
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                VariableUtils
                                                                    .Dropofftitle,
                                                                style: FontTextStyle
                                                                        .GorditaW5S10lightBlack
                                                                    .copyWith(
                                                                        fontWeight:
                                                                            FontWeightClass.bold),
                                                              ),
                                                              Text(
                                                                VariableUtils
                                                                    .dropoffaddress,
                                                                style: FontTextStyle
                                                                        .GorditaW5S10lightBlack
                                                                    .copyWith(
                                                                  fontSize:
                                                                      11.sp,
                                                                ),
                                                              ),
                                                              Text(
                                                                VariableUtils
                                                                    .dropoffdate,
                                                                style: FontTextStyle
                                                                        .GorditaW5S10lightBlack
                                                                    .copyWith(
                                                                        color: ColorUtils
                                                                            .black
                                                                            .withOpacity(0.5)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Row(
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       children: [
                              //         SvgPicture.asset(
                              //           ImageUtils.dot,
                              //           height: 2.w,
                              //         ),
                              //         SizedBox(
                              //           width: 5.w,
                              //         ),
                              //         Text(
                              //           VariableUtils.pickup,
                              //           style: FontTextStyle
                              //               .GorditaW5S10lightBlack,
                              //         ),
                              //       ],
                              //     ),
                              //     SizedBox(
                              //       height: 2.w,
                              //     ),
                              //     Padding(
                              //       padding:
                              //           EdgeInsets.symmetric(horizontal: 6.5.w),
                              //       child: Text(
                              //         VariableUtils.Pichaddress,
                              //         style:
                              //             FontTextStyle.GorditaW5S10lightBlack,
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       height: 1.w,
                              //     ),
                              //     Padding(
                              //       padding:
                              //           EdgeInsets.symmetric(horizontal: 6.5.w),
                              //       child: Text(
                              //         VariableUtils.pickdate,
                              //         style:
                              //             FontTextStyle.GorditaW5S10lightBlack
                              //                 .copyWith(
                              //                     color: ColorUtils.black
                              //                         .withOpacity(0.5)),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 7.w,
                              // ),
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Row(
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       children: [
                              //         SvgPicture.asset(
                              //           ImageUtils.dot,
                              //           height: 2.w,
                              //         ),
                              //         SizedBox(
                              //           width: 5.w,
                              //         ),
                              //         Text(
                              //           VariableUtils.Dropofftitle,
                              //           style: FontTextStyle
                              //               .GorditaW5S10lightBlack,
                              //         ),
                              //       ],
                              //     ),
                              //     SizedBox(
                              //       height: 2.w,
                              //     ),
                              //     Padding(
                              //       padding:
                              //           EdgeInsets.symmetric(horizontal: 6.5.w),
                              //       child: Text(
                              //         VariableUtils.dropoffaddress,
                              //         style:
                              //             FontTextStyle.GorditaW5S10lightBlack,
                              //       ),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Divider(
                        color: ColorUtils.black,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.00),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 1.w,
                            ),
                            Stack(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              children: [
                                CircleAvatar(
                                  // backgroundColor: ColorUtils.blue,
                                  backgroundImage:
                                      AssetImage(ImageUtils.profile3),
                                  radius: 5.w,
                                ),
                                Positioned(
                                  bottom: -5,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                        color: ColorUtils.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.symmetric(vertical: 1),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 12,
                                          color: ColorUtils.black,
                                        ),
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.w),
                                  child: Text(
                                    VariableUtils.custName,
                                    style: FontTextStyle.GorditaW5S10lightBlack,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.w),
                                  child: Text(
                                    'Lippy Sukodu',
                                    style: FontTextStyle.GorditaW7S10darkBlack,
                                  ),
                                ),
                                // Container(
                                //   padding: EdgeInsets.all(1.w),
                                //   // height: 6.w,
                                //   // width: 35.w,
                                //   decoration: BoxDecoration(
                                //       color: ColorUtils.lightBlack
                                //           .withOpacity(0.07),
                                //       borderRadius:
                                //           BorderRadius.circular(10.w)),
                                //   child: Center(
                                //     child: Text(
                                //       VariableUtils.custPayment,
                                //       style: FontTextStyle
                                //               .GorditaW5S10lightBlack
                                //           .copyWith(color: ColorUtils.black),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            Spacer(),
                            CustomButton(
                              width: 32.w,
                              height: 10.w,
                              // height: 10.w,
                              title: 'Get Details',
                              textColor: Color(0xffEAFDE6),
                              backgroundColor: ColorUtils.darkBlack,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomeDetailPage()));
                              },
                            )
                          ],
                        ),
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

  Widget appBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.5.w),
      color: ColorUtils.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  _scaffoldkey.currentState!.openDrawer();
                },
                child: SvgPicture.asset(
                  ImageUtils.menu,
                  height: 5.w,
                  color: ColorUtils.black,
                ),
              ),
              Text(
                'home',
                style: FontTextStyle.GorditaW7S12darkBlack,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FilterBy()));
                },
                child: SvgPicture.asset(
                  ImageUtils.endmenu,
                  height: 5.w,
                  color: ColorUtils.black,
                ),
              ),

              // add shortlisticon
            ],
          ),
        ],
      ),
    );
  }
}
