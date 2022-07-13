import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/views/SideMenu/settings/terms&condition.dart';

import '../../../utils/image_utils.dart';
import '../../../utils/variable_utils.dart';
import '../../Message/Widgets/custome_appbar.dart';

import '../../home/widgets/home_appbar_custom.dart';
import '../widgets/customsetting_list.dart';
import 'aboutus_screen.dart';
import 'changepass_screen.dart';
import 'changephonenum_screen.dart';
import 'help&support.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(15.w),
              child: Container(
                color: ColorUtils.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
                  child: Column(
                    children: [
                      CustomHomeAppbar(
                        backIcon: ImageUtils.backIcon,
                        backOnTap: () {
                          Navigator.pop(context);
                        },
                        titleName: 'Settings',
                      )
                    ],
                  ),
                ),
              )),
          backgroundColor: ColorUtils.aliceBlue,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
            child: Column(
              children: [
                SizedBox(
                  height: 5.w,
                ),
                CustomSettingList(
                  titleName: VariableUtils.changepass,
                  forwordIcon: ImageUtils.forwardIcon,
                  forwordTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ChangePasswordScreen()));
                  },
                ),
                SizedBox(
                  height: 4.w,
                ),
                CustomSettingList(
                  titleName: VariableUtils.Changephonenumber,
                  forwordIcon: ImageUtils.forwardIcon,
                  forwordTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ChangePhoneNumberScreen()));
                  },
                ),
                SizedBox(
                  height: 4.w,
                ),
                CustomSettingList(
                  titleName: VariableUtils.Aboutus,
                  forwordIcon: ImageUtils.forwardIcon,
                  forwordTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUsScreen()));
                  },
                ),
                SizedBox(
                  height: 4.w,
                ),
                CustomSettingList(
                  titleName: VariableUtils.help,
                  forwordIcon: ImageUtils.forwardIcon,
                  forwordTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HelpSupportScreen()));
                  },
                ),
                SizedBox(
                  height: 4.w,
                ),
                CustomSettingList(
                  titleName: VariableUtils.condition,
                  forwordIcon: ImageUtils.forwardIcon,
                  forwordTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TermAndConditionSettingScreen()));
                  },
                ),
                Spacer(),
                Text(
                  'V1.2',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeightClass.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
