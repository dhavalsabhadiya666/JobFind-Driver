import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:telescope_driver/viewmodel/bottom_bar_viewmodel.dart';
import 'package:telescope_driver/views/notifications/notificationdetail_screen.dart';

import '../../widgets/drawer.dart';
import '../../utils/image_utils.dart';
import '../../widgets/custombutton.dart';
import '../Message/Widgets/custome_appbar.dart';

class Notification1 extends StatefulWidget {
  const Notification1({Key? key}) : super(key: key);

  @override
  State<Notification1> createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  final _bottomBarViewModel = Get.find<BottomBarViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldkey,
          // drawer: UserDrawer(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(15.w),
            child: CustomSettingAppBar(
              backIcon: ImageUtils.menu,
              backOnTap: () {
                _bottomBarViewModel.setIsDrawerVisible();
                // _scaffoldkey.currentState!.openDrawer();
              },
              titleName: 'notifications',
              otherIcon: ImageUtils.delete,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              VariableUtils.newmessage,
                              style:
                                  FontTextStyle.GorditaW5S12darkBlack.copyWith(
                                      fontWeight: FontWeightClass.bold),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorUtils.primaryLight),
                              child: Text(
                                VariableUtils.now,
                                style: FontTextStyle.GorditaW7S10darkBlack
                                    .copyWith(fontSize: 8.sp),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3.w,
                        ),
                        Text(
                          VariableUtils.sendmessage,
                          style: FontTextStyle.GorditaW5S10lightBlack.copyWith(
                              color: ColorUtils.black),
                        ),
                        Text(
                          VariableUtils.message1,
                          style: FontTextStyle.GorditaW5S10lightBlack.copyWith(
                              color: ColorUtils.black),
                        ),
                        Text(
                          VariableUtils.message2,
                          style: FontTextStyle.GorditaW5S10lightBlack.copyWith(
                              color: ColorUtils.black),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        CustomButton(
                          title: 'Replay',
                          onPressed: () {},
                          width: 30.w,
                          height: 12.w,
                          backgroundColor: ColorUtils.darkBlack,
                          textColor: ColorUtils.primaryColor,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  Divider(),
                  SizedBox(
                    height: 8.w,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              VariableUtils.joboffer,
                              style:
                                  FontTextStyle.GorditaW5S12darkBlack.copyWith(
                                      fontWeight: FontWeightClass.bold),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorUtils.primaryLight),
                              child: Text(
                                VariableUtils.yesterday,
                                style: FontTextStyle.GorditaW7S10darkBlack
                                    .copyWith(fontSize: 8.sp),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3.w,
                        ),
                        Text(VariableUtils.msgdesc,
                            style:
                                FontTextStyle.GorditaW5S10lightBlack.copyWith(
                                    color: ColorUtils.black)),
                        SizedBox(
                          height: 5.w,
                        ),
                        Row(
                          children: [
                            CustomButton(
                              width: 32.w,
                              height: 12.w,
                              title: 'See Offer',
                              onPressed: () {},
                              backgroundColor: ColorUtils.darkBlack,
                              textColor: ColorUtils.primaryColor,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            CustomButton(
                              width: 30.w,
                              height: 12.w,
                              title: 'Accept',
                              onPressed: () {},
                              backgroundColor: ColorUtils.primaryColor,
                              textColor: ColorUtils.darkBlack,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            CustomButton(
                              width: 30.w,
                              height: 12.w,
                              title: 'Decline',
                              onPressed: () {
                                Get.to(() => NotificationDetailPage());
                              },
                              backgroundColor: ColorUtils.red,
                              textColor: ColorUtils.white,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  Divider(),
                  SizedBox(
                    height: 12.w,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              VariableUtils.congratulation,
                              style:
                                  FontTextStyle.GorditaW5S12darkBlack.copyWith(
                                      fontWeight: FontWeightClass.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  VariableUtils.congratulation1,
                                  style: FontTextStyle.GorditaW5S12darkBlack
                                      .copyWith(
                                          fontWeight: FontWeightClass.bold),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorUtils.primaryLight),
                                  child: Text(
                                    VariableUtils.date,
                                    style: FontTextStyle.GorditaW7S10darkBlack
                                        .copyWith(fontSize: 8.sp),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Text(
                          VariableUtils.congodesc,
                          style: FontTextStyle.GorditaW5S10lightBlack.copyWith(
                              color: ColorUtils.black),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        CustomButton(
                          title: 'message',
                          onPressed: () {},
                          width: 30.w,
                          height: 12.w,
                          backgroundColor: ColorUtils.darkBlack,
                          textColor: ColorUtils.primaryColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
