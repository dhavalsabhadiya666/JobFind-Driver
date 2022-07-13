import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/viewmodel/bottom_bar_viewmodel.dart';
import 'package:telescope_driver/widgets/drawer.dart';
import '../Message/messagenotification_screen.dart';
import '../Notifications/notification_screen.dart';
import '../SideMenu/myprofile_screen.dart';
import '../myjobs/myjobspending.dart';
import 'HomePage.dart';

class NewBottomNavBar extends StatefulWidget {
  const NewBottomNavBar({Key? key}) : super(key: key);

  @override
  State<NewBottomNavBar> createState() => _NewBottomNavBarState();
}

class _NewBottomNavBarState extends State<NewBottomNavBar> {
  int _selectedIndex = 0;
  int isSelected = 0;
  final List = [
    HomePage(),
    Notification1(),
    MyJobsPending(),
    NotificationScreen(),
    // NotificationScreen(),
    MyProfileScreen(),
  ];

  get pages => List;
  final _bottomBarViewModel = Get.find<BottomBarViewModel>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GetBuilder<BottomBarViewModel>(
        builder: (controller) {
          return Stack(
            children: [
              UserDrawer(),
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                height: Get.height,
                width: Get.width,
                transform: !controller.isDrawerVisible
                    ? (Matrix4.translationValues(0.0, 0.0, 0)..scale(1.25))
                    : Matrix4.translationValues(
                        Get.width * 0.7, Get.height * 0.11, 0)
                  ..scale(0.8),
                child: GestureDetector(
                  onTap: () {
                    if (controller.isDrawerVisible) {
                      _bottomBarViewModel.setIsDrawerVisible();
                    }
                  },
                  child: ClipRRect(
                    borderRadius: !controller.isDrawerVisible
                        ? BorderRadius.zero
                        : BorderRadius.horizontal(left: Radius.circular(20)),
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      body: List[_selectedIndex],
                      bottomNavigationBar: Container(
                        child: ClipRRect(
                          child: BottomNavigationBar(
                            backgroundColor: ColorUtils.darkBlack,
                            type: BottomNavigationBarType.fixed,
                            currentIndex: _selectedIndex,
                            iconSize: 30,
                            onTap: (int index) {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            items: <BottomNavigationBarItem>[
                              BottomNavigationBarItem(
                                icon: Image.asset(
                                  ImageUtils.bottomhome1,
                                  height: 5.w,
                                  color: _selectedIndex == 0
                                      ? ColorUtils.primaryColor
                                      : ColorUtils.grey,
                                ),
                                backgroundColor: ColorUtils.darkBlack,
                                label: "home",
                              ),
                              BottomNavigationBarItem(
                                icon: Image.asset(
                                  ImageUtils.bottomnotification1,
                                  height: 5.w,
                                  color: _selectedIndex == 1
                                      ? ColorUtils.primaryColor
                                      : ColorUtils.grey,
                                ),
                                backgroundColor: ColorUtils.darkBlack,
                                label: "notifications",
                              ),
                              BottomNavigationBarItem(
                                icon: Image.asset(
                                  ImageUtils.bottommyjobs1,
                                  height: 5.w,
                                  color: _selectedIndex == 2
                                      ? ColorUtils.primaryColor
                                      : ColorUtils.grey,
                                ),
                                backgroundColor: ColorUtils.darkBlack,
                                label: "My Jobs",
                              ),
                              BottomNavigationBarItem(
                                icon: Image.asset(
                                  ImageUtils.bottommessages1,
                                  height: 5.w,
                                  color: _selectedIndex == 3
                                      ? ColorUtils.primaryColor
                                      : ColorUtils.grey,
                                ),
                                backgroundColor: ColorUtils.darkBlack,
                                label: "Messages",
                              ),
                              BottomNavigationBarItem(
                                icon: Image.asset(
                                  ImageUtils.bottomprofile1,
                                  height: 5.w,
                                  color: _selectedIndex == 4
                                      ? ColorUtils.primaryColor
                                      : ColorUtils.grey,
                                ),
                                backgroundColor: ColorUtils.darkBlack,
                                label: "My Profile",
                              ),
                            ],
                            selectedItemColor: ColorUtils.primaryColor,
                            unselectedItemColor: ColorUtils.grey,
                            selectedLabelStyle:
                                TextStyle(color: ColorUtils.white),
                            unselectedLabelStyle:
                                TextStyle(color: ColorUtils.grey),
                            showSelectedLabels: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
