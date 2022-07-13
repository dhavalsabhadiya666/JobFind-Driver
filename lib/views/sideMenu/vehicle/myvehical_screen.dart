import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/viewmodel/bottom_bar_viewmodel.dart';
import 'package:telescope_driver/views/home/widgets/home_appbar_custom.dart';
import 'package:telescope_driver/views/sideMenu/vehicle/vehicle_info.dart';

class MyVehicalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(15.w),
            child: Container(
              color: ColorUtils.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
                child: Column(
                  children: [
                    CustomHomeAppbar(
                      backIcon: ImageUtils.backIcon,
                      backOnTap: () {
                        Get.back();
                      },
                      titleName: 'My Vehicle',
                    )
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.w),
                      child: Container(
                        height: 32.w,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.more_horiz,
                                  size: 40,
                                  color: ColorUtils.grey.withOpacity(0.5),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Container(
                                    height: 20.w,
                                    width: 20.w,
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 9.w,
                                          backgroundImage:
                                              AssetImage(ImageUtils.car),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            height: 8.w,
                                            width: 8.w,
                                            decoration: BoxDecoration(
                                              color: ColorUtils.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Image.asset(
                                              ImageUtils.editIcon,
                                              scale: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "License plate : KJDD05",
                                          style: FontTextStyle
                                              .GorditaW6S10darkBlack,
                                        ),
                                        Text(
                                          "2022 Ford F-150 Pickup Truck",
                                          style: FontTextStyle
                                              .gilroyW7S14darkBlack,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => VehicleInfoScreen());
                  },
                  child: Container(
                    height: 12.w,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: ColorUtils.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Add New Vehicle",
                        style: FontTextStyle.gilroyW7S14darkBlack,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
