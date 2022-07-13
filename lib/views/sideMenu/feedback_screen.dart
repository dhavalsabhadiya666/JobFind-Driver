import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';

import '../../utils/font_style_utils.dart';
import '../../utils/image_utils.dart';
import '../../utils/variable_utils.dart';
import '../Message/Widgets/custome_appbar.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(
              context) /*PreferredSize(
              preferredSize: Size.fromHeight(20.w),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        color: ColorUtils.white,
                        child: appBar()),
                  ],
                ),
              ))*/
          ,
          // backgroundColor: ColorUtils.aliceBlue,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.all(1.9.w),
                          margin: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(color: Color(0xffF6F8FA)),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          //child: Text('PP'),
                                          backgroundImage:
                                              AssetImage(ImageUtils.profile2),
                                          radius: 25,
                                        ),
                                        Text(
                                          VariableUtils.feedbackName,
                                          style: FontTextStyle
                                              .GorditaW5S14darkBlack,
                                        ),
                                        Container(
                                          width: 15.w,
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: ColorUtils.primaryLight,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '4.5',
                                                style: FontTextStyle
                                                    .GorditaW7S10darkBlack,
                                              ),
                                              SvgPicture.asset(
                                                ImageUtils.like,
                                                height: 3.w,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 3.w,
                                    ),
                                    Text(
                                      VariableUtils.feedbackdesc,
                                      style:
                                          FontTextStyle.GorditaW5S10lightBlack,
                                    ),
                                    SizedBox(
                                      height: 2.w,
                                    ),
                                    Divider(),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            // showModalBottomSheet(
                                            //     enableDrag: true,
                                            //     isScrollControlled: true,
                                            //     backgroundColor: Colors.transparent,
                                            //     context: context,
                                            //     builder: (context) {
                                            //       return showModelBottom();
                                            //     });
                                          },
                                          child: Text(
                                            VariableUtils.fullRatings,
                                            style: FontTextStyle
                                                    .GorditaW7S10darkBlack
                                                .copyWith(
                                                    color: ColorUtils.accent,
                                                    decoration: TextDecoration
                                                        .underline),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // showModalBottomSheet(
                                            //     enableDrag: true,
                                            //     isScrollControlled: true,
                                            //     backgroundColor: Colors.transparent,
                                            //     context: context,
                                            //     builder: (context) {
                                            //       return showModelBottom();
                                            //     });
                                          },
                                          child: Text(
                                            VariableUtils.replay,
                                            style: FontTextStyle
                                                    .GorditaW7S10darkBlack
                                                .copyWith(
                                                    color: ColorUtils.accent,
                                                    decoration: TextDecoration
                                                        .underline),
                                          ),
                                        ),
                                        Spacer(),
                                        SvgPicture.asset(
                                          ImageUtils.more,
                                          height: 1.5.w,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: ColorUtils.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.2), //color of shadow
                                        spreadRadius: 2, //spread radius
                                        blurRadius: 10, // blur radius
                                        // offset: Offset(0, 3),
                                      )
                                    ]),
                              ),
                              Container(
                                  // margin: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey.withOpacity(0.1),
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(5))),
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
                                        style:
                                            FontTextStyle.GorditaW7S10darkBlack,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        '@Deni Olgamo',
                                        style: FontTextStyle
                                            .GorditaW5S10lightBlack,
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
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
        VariableUtils.myfeedbak,
        style: FontTextStyle.GorditaW7S12darkBlack.copyWith(fontSize: 14.sp),
      ),
      actions: [
        SvgPicture.asset(
          ImageUtils.search,
          height: 5.w,
        ),
        SizedBox(
          width: 3.w,
        ),
        SvgPicture.asset(
          ImageUtils.sortArrow,
          height: 4.w,
        ),
        SizedBox(
          width: 3.w,
        ),
      ],
      centerTitle: true,
    );
  }

  Widget appBar() {
    return Container(
      color: ColorUtils.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 3.w, right: 2.w, top: 3.w, bottom: 3.w),
                    child: SvgPicture.asset(
                      ImageUtils.backIcon,
                      height: 4.5.w,
                      color: ColorUtils.black,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 3.w),
                child: Text(
                  VariableUtils.myfeedbak,
                  style: FontTextStyle.GorditaW7S12darkBlack.copyWith(
                      fontSize: 16.sp),
                ),
              ),
              Container(
                  width: 15.w,
                  //color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        ImageUtils.search,
                        height: 5.w,
                      ),
                      SvgPicture.asset(
                        ImageUtils.sortArrow,
                        height: 4.w,
                      )
                    ],
                  ))
            ],
          ),
          // Text(
          //   VariableUtils.possible,
          //   style: FontTextStyle.GorditaW4S10lightBlack,
          // )
        ],
      ),
    );
  }
}
