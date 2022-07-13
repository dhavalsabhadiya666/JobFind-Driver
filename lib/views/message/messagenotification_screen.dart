import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/viewmodel/bottom_bar_viewmodel.dart';

import '../../widgets/drawer.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/image_utils.dart';
import '../home/widgets/home_appbar_custom.dart';

import 'Widgets/custome_appbar.dart';
import 'chat_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                titleName: 'message',
                otherIcon: ImageUtils.search,
              )),
          backgroundColor: ColorUtils.aliceBlue,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180.w,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MessageChatScreen()));
                            },
                            child: Container(
                              margin: EdgeInsets.all(2.w),
                              decoration:
                                  BoxDecoration(color: ColorUtils.white),
                              child: ListTile(
                                leading: CircleAvatar(
                                  //child: Text('PP'),
                                  backgroundImage:
                                      AssetImage(ImageUtils.profile2),
                                  radius: 20,
                                ),
                                title: Text(
                                  'Goli Keticodo',
                                  style: FontTextStyle.GorditaW7S10darkBlack,
                                ),
                                subtitle: Text(
                                  'Hello Goli',
                                  style: FontTextStyle.GorditaW5S10lightBlack,
                                ),
                                trailing: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //     SizedBox(),
                                    Text(
                                      '9:45pm',
                                      style:
                                          FontTextStyle.GorditaW5S10lightBlack
                                              .copyWith(fontSize: 8.sp),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(1.6.w),
                                      decoration: BoxDecoration(
                                          color: ColorUtils.accent,
                                          shape: BoxShape.circle),
                                      child: Text(
                                        '1',
                                        style: FontTextStyle
                                                .GorditaW7S10darkBlack
                                            .copyWith(color: ColorUtils.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
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
