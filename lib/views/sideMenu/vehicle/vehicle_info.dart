import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/views/home/widgets/home_appbar_custom.dart';
import 'package:telescope_driver/views/sideMenu/vehicle/vehicle_info_edit.dart';
import 'package:telescope_driver/views/signup/SignupScreen.dart';
import 'package:telescope_driver/widgets/CustomeTextFormFeild.dart';
import 'package:telescope_driver/widgets/custombutton.dart';

class VehicleInfoScreen extends StatefulWidget {
  @override
  State<VehicleInfoScreen> createState() => _VehicleInfoScreenState();
}

class _VehicleInfoScreenState extends State<VehicleInfoScreen> {
  List<VehicleTypeModel> listVehicleType = [
    VehicleTypeModel(title: 'Bicycle', img: ImageUtils.bicycleImg),
    VehicleTypeModel(title: 'E-Bike', img: ImageUtils.eBikeImg),
    VehicleTypeModel(title: 'Motorcycle', img: ImageUtils.motorcycleImg),
    VehicleTypeModel(title: 'Fleet', img: ImageUtils.fleetImg),
    VehicleTypeModel(title: 'Box Truck', img: ImageUtils.boxTruckImg),
  ];

  String selectedVehicleType = '';

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
                      titleName: 'Vehicle Info',
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.w,
                  ),
                  Container(
                    height: 40.w,
                    width: 40.w,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 30.w,
                          backgroundColor: ColorUtils.grey.withOpacity(0.3),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            ImageUtils.cameraCircle,
                            scale: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  CustomInputField(
                    fieldName: 'Vehicle name',
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  CustomInputField(
                    fieldName: 'Vehicle license plate',
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    'Choose Vehicle Type',
                    style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                        fontWeight: FontWeightClass.bold),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.1,
                        mainAxisSpacing: 10),
                    children: listVehicleType
                        .map((e) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedVehicleType = e.title!;
                                });
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: selectedVehicleType == e.title!
                                            ? ColorUtils.primaryColor
                                            : Color(0xff0000004)
                                                .withOpacity(0.1))),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                              e.img!,
                                              scale: 10,
                                            ),
                                            Text(e.title!)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 5,
                                      top: 5,
                                      child: checkBox(e.title!),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  CustomInputField(
                    fieldName: 'Enter other vehicle type',
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  CustomButton(
                    height: 12.w,
                    width: 88.w,
                    onPressed: () {
                      Get.to(() => VehicleInfoEditScreen());
                    },
                    title: 'Add Now',
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container checkBox(String title) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selectedVehicleType == title
            ? Color(0xff012239)
            : Color(0xff0000004).withOpacity(0.1),
      ),
      child: selectedVehicleType == title
          ? Center(
              child:
                  Icon(Icons.check, size: 13, color: ColorUtils.primaryColor))
          : SizedBox(),
    );
  }
}
