import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:telescope_driver/utils/color_utils.dart';

import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/viewmodel/bottom_bar_viewmodel.dart';

import 'package:telescope_driver/views/myjobs/pending.dart';

import '../../widgets/drawer.dart';
import '../home/widgets/home_appbar_custom.dart';
import 'accepted_job_tab.dart';
import 'completed.dart';

class MyJobsPending extends StatefulWidget {
  const MyJobsPending({Key? key}) : super(key: key);

  @override
  State<MyJobsPending> createState() => _MyJobsPendingState();
}

class _MyJobsPendingState extends State<MyJobsPending>
    with SingleTickerProviderStateMixin {
  TabController? _tabs;
  int? selected;

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabs!.dispose();
  }

  final _bottomBarViewModel = Get.find<BottomBarViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldkey,
          backgroundColor: ColorUtils.aliceBlue,
          // drawer: UserDrawer(),
          appBar: PreferredSize(
            child: Container(
              color: ColorUtils.white,
              child: Padding(
                padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 3.w),
                child: Column(
                  children: [
                    CustomHomeAppbar(
                      backIcon: ImageUtils.menu,
                      backOnTap: () {
                        _bottomBarViewModel.setIsDrawerVisible();
                        // _scaffoldkey.currentState!.openDrawer();
                      },
                      titleName: VariableUtils.myJobs,
                      authIcon: ImageUtils.unLike,
                      authOnTap: () {},
                    ),
                    // SizedBox(
                    //   height: 4.w,
                    // ),
                    Spacer(),
                    TabBar(
                        // isScrollable: true,
                        // indicatorPadding: EdgeInsets.symmetric(horizontal: 2.w),
                        // padding: EdgeInsets.symmetric(horizontal: 3.w),
                        onTap: (value) {
                          setState(() {
                            selected = value;
                          });
                        },
                        indicatorColor: ColorUtils.primaryColor,
                        labelStyle: FontTextStyle.GorditaW7S10darkBlack,
                        labelColor: ColorUtils.darkBlack,
                        unselectedLabelColor: ColorUtils.lightBlack,
                        indicatorSize: TabBarIndicatorSize.tab,
                        padding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.symmetric(
                            vertical: 1.w, horizontal: 6.w),
                        unselectedLabelStyle:
                            FontTextStyle.GorditaW5S10lightBlack,
                        controller: _tabs,
                        tabs: [
                          Text(
                            VariableUtils.pending,
                          ),
                          Text(
                            'Accepted',
                          ),
                          Text(
                            VariableUtils.complate,
                          )
                        ])
                  ],
                ),
              ),
            ),
            preferredSize: Size.fromHeight(25.w),
          ),
          body: TabBarView(
            controller: _tabs,
            children: [
              PendingPage(),
              AcceptedJobTab(),
              CompletedPage(),
            ],
          ),
        ),
      ),
    );
  }
}
