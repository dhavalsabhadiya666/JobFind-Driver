import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:telescope_driver/model/apiModel/responseModel/register_res_model.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/const_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/pref_manager_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:telescope_driver/views/SideMenu/bankdetails_screen.dart';
import 'package:telescope_driver/views/SideMenu/feedback_screen.dart';
import 'package:telescope_driver/views/SideMenu/myearning_screen.dart';
import 'package:telescope_driver/views/SideMenu/settings/settings_screen.dart';
import 'package:telescope_driver/views/login/Login_screen.dart';
import 'package:telescope_driver/views/myjobs/myjobspending.dart';
import 'package:telescope_driver/views/sideMenu/mycard_screen.dart';
import 'package:telescope_driver/views/sideMenu/vehicle/myvehical_screen.dart';
import 'package:telescope_driver/widgets/custombutton.dart';

import '../views/sideMenu/myprofile_screen.dart';

class UserDrawer extends StatefulWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  late UserData userData;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    userData = ConstUtils.kGetUserData();
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    // print('IMAGE :${ConstUtils.kImageBasePath + userData.image!}');
    return Container(
      color: ColorUtils.accent,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.w,
                      ),

                      Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.w),
                            side: BorderSide(
                                color: ColorUtils.accent, width: 1.w)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.w),
                          child: userData.image != null
                              ? Image.network(
                                  ConstUtils.kImageBasePath + userData.image!,
                                  height: 20.w,
                                  width: 20.w,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                    ImageUtils.bottomprofile1,
                                    height: 20.w,
                                    width: 20.w,
                                    fit: BoxFit.fill,
                                  ),
                                  loadingBuilder: (context, child, event) {
                                    if (event == null) {
                                      return child;
                                    }
                                    return Image.asset(
                                      ImageUtils.bottomprofile1,
                                      height: 20.w,
                                      width: 20.w,
                                      fit: BoxFit.fill,
                                    );
                                  },
                                )
                              : Image.asset(
                                  ImageUtils.bottomprofile1,
                                  height: 20.w,
                                  width: 20.w,
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),

                      // Container(
                      //     height: 20.w,
                      //     width: 20.w,
                      //     decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //           fit: BoxFit.cover,
                      //           image: AssetImage(
                      //             ImageUtils.drawerprofile,
                      //           )),
                      //       border: Border.all(color: ColorUtils.accent, width: 1.w),
                      //       borderRadius: BorderRadius.circular(5.w),
                      //     ),
                      //     child: Text("")),
                      SizedBox(
                        height: 5.w,
                      ),
                      Text(
                        (userData.firstName ?? 'Robin') +
                            ' ' +
                            (userData.lastName ?? 'Colida'),
                        style: FontTextStyle.GorditaW5S14darkBlack.copyWith(
                            color: ColorUtils.white,
                            fontWeight: FontWeightClass.bold),
                      ),
                      // SizedBox(
                      //   height: 2.w,
                      // ),
                      Text(
                        userData.email ?? 'robincolida789@gmail.com',
                        style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                            color: ColorUtils.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.w,
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    ImageUtils.bottomprofile,
                    height: 4.5.w,
                    color: ColorUtils.white,
                  ),
                  title: Text('My Profile',
                      style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                          color: ColorUtils.white)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyProfileScreen()));
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    ImageUtils.earningicon,
                    height: 4.5.w,
                    color: ColorUtils.white,
                  ),
                  title: Text('My Earning',
                      style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                          color: ColorUtils.white)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyEarningScreen()));
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    ImageUtils.bankicon,
                    height: 4.5.w,
                    color: ColorUtils.white,
                  ),
                  title: Text(VariableUtils.bankinfo,
                      style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                          color: ColorUtils.white)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BankDetailsScreen()));
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    ImageUtils.feedback,
                    height: 4.5.w,
                    color: ColorUtils.white,
                  ),
                  title: Text('Feedback',
                      style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                          color: ColorUtils.white)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeedbackScreen()));
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    ImageUtils.likeWhite,
                    height: 4.5.w,
                    color: ColorUtils.white,
                  ),
                  title: Text('Completed Jobs',
                      style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                          color: ColorUtils.white)),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => FeedbackScreen()));
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    ImageUtils.vehicle,
                    height: 4.5.w,
                    color: ColorUtils.white,
                  ),
                  title: Text('My Vehicle',
                      style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                          color: ColorUtils.white)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyVehicalScreen()));
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    ImageUtils.myCard,
                    height: 4.5.w,
                    color: ColorUtils.white,
                  ),
                  title: Text('My Card',
                      style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                          color: ColorUtils.white)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyCardScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    ImageUtils.settings,
                    height: 4.5.w,
                    color: ColorUtils.white,
                  ),
                  title: Text(VariableUtils.settings,
                      style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                          color: ColorUtils.white)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingScreen()));
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              ImageUtils.logout,
              height: 4.5.w,
              color: ColorUtils.white,
            ),
            title: Text(VariableUtils.logout,
                style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                    color: ColorUtils.white)),
            trailing: Text(
              'V1.2',
              style: TextStyle(
                  color: Colors.white60, fontWeight: FontWeightClass.bold),
            ),
            onTap: () {
              showModalBottomSheet(
                  enableDrag: true,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return showModelBottom();
                  });
            },
          ),
        ],
      ),
    );
  }

  Widget showModelBottom() {
    return Container(
      height: 100.w,
      color: ColorUtils.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.w),
                  child: Container(
                    padding: EdgeInsets.all(7.w),
                    decoration: BoxDecoration(
                      color: ColorUtils.primaryLight,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      ImageUtils.logoutBigIcon,
                      height: 14.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.w,
                ),
                Text(
                  VariableUtils.logout,
                  style: FontTextStyle.GorditaW5S14darkBlack,
                ),
                SizedBox(
                  height: 3.w,
                ),
                Text(
                  VariableUtils.loginDes,
                  style: FontTextStyle.GorditaW5S10lightBlack,
                ),
                Text(
                  'Are you sure logout?',
                  style: FontTextStyle.GorditaW5S10lightBlack,
                ),
                SizedBox(
                  height: 8.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                        title: 'Yes',

                        onPressed: () async {
                          await PrefManagerUtils.setUserLoginStatus(false);
                          Get.offAll(Loginscreen());
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => MyJobsPending()));
                        },
                        backgroundColor: ColorUtils.accent,
                        textColor: ColorUtils.white,
                        // width: 40.w,
                        textStyle: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                            color: ColorUtils.primaryColor),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.w,
                ),
                Text(
                  'Cancel',
                  style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                      decoration: TextDecoration.underline),
                ),
                SizedBox(
                  height: 5.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
