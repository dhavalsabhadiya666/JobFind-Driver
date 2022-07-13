import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:telescope_driver/views/sideMenu/vehicle/edit_vehicle_screen.dart';
import 'package:telescope_driver/widgets/custombutton.dart';

class VehicleInfoEditScreen extends StatelessWidget {
  const VehicleInfoEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(context),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.w,
                  ),
                  CircleAvatar(
                    radius: 25.w,
                    backgroundColor: ColorUtils.grey.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.VehicleName,
                    style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                        fontWeight: FontWeightClass.bold),
                  ),
                  Text(
                    "2022 Ford F-150 Pickup Truck",
                    style: FontTextStyle.gilroyW7S14darkBlack,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.VehicleLicense,
                    style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                        fontWeight: FontWeightClass.bold),
                  ),
                  Text(
                    "KJDD05",
                    style: FontTextStyle.gilroyW7S14darkBlack,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            VariableUtils.VehicleType,
                            style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                                fontWeight: FontWeightClass.bold),
                          ),
                          Text(
                            "E-Bike",
                            style: FontTextStyle.gilroyW7S14darkBlack,
                          ),
                        ],
                      ),
                      Image.asset(
                        ImageUtils.deliveryScotter,
                        scale: 2.w,
                      ),
                    ],
                  ),
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
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => EditVehicleScreen());
              },
              child: CustomButton(
                height: 10.w,
                width: 70,
                title: "Edit",
              ),
            ),
          ],
        ),
        SizedBox(
          width: 5.w,
        ),
      ],
      centerTitle: true,
    );
  }
}
