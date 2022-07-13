import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/common/pick_files.dart';
import 'package:telescope_driver/utils/const_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:telescope_driver/viewmodel/bottom_bar_viewmodel.dart';
import 'package:telescope_driver/widgets/custom_insurance.dart';
import 'package:telescope_driver/widgets/custon_uploadbutton.dart';

import '../../widgets/drawer.dart';
import '../../utils/color_utils.dart';
import '../../utils/image_utils.dart';
import '../../widgets/CustomeTextFormFeild.dart';
import '../../widgets/custombutton.dart';
import '../Message/Widgets/custome_appbar.dart';

import '../home/widgets/home_appbar_custom.dart';
import 'myearning_screen.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  TextEditingController _firstname = new TextEditingController();
  TextEditingController _lastname = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  final _bottomBarViewModel = Get.find<BottomBarViewModel>();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldkey =
        new GlobalKey<ScaffoldState>();

    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorUtils.white,
          key: _scaffoldkey,
          // drawer: UserDrawer(),
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
                        titleName: 'My Profile',
                      )
                    ],
                  ),
                ),
              )),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerFloat,
          // floatingActionButton: Container(
          //   //color: ColorUtils.red,
          //   height: 52.w,
          //
          //   //width: 30.w,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Row(
          //         children: [
          //           Expanded(
          //               child: CustomButton(
          //                   height: 20.w,
          //                   onPressed: () {
          //                     Navigator.pop(context);
          //                   },
          //                   backgroundColor: ColorUtils.darkBlack,
          //                   title: 'Save'))
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.w,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorUtils.blue,
                          // foregroundImage:  AssetImage(ImageUtils.charge1),
                          backgroundImage:
                              AssetImage(ImageUtils.bottomprofile1),

                          radius: 15.w,
                        ),
                        Positioned(
                          bottom: 0.w,
                          right: -1.w,
                          child: GestureDetector(
                              onTap: () async {
                                // final file =
                                // await PickFiles.getImage();
                                // if (file != '') {
                                //   viewModel.profilePic = file;
                                // }
                              },
                              child: Center(
                                child: Image.asset(
                                  ImageUtils.cameraCircle,
                                  scale: 17,
                                ),
                                // child: SvgPicture.asset(
                                //     ImageUtils.camera,
                                //     height: 10.w),
                              )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.w,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomInputField(
                        fieldController: _firstname,
                        fieldName: 'First name',
                      )),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                          child: CustomInputField(
                        fieldController: _lastname,
                        fieldName: 'Last name',
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 6.w,
                  ),
                  CustomInputField(
                    fieldController: _email,
                    fieldName: 'Email address',
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.oldPhNumber,
                    style: FontTextStyle.GorditaW7S10darkBlack,
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 0,
                        child: Container(
                          height: 12.w,
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: ColorUtils.aliceBlue,
                            borderRadius: BorderRadius.circular(4.5),
                          ),
                          //margin: EdgeInsets.symmetric(horizontal: 20),
                          child: DropdownButton(
                            // isExpanded: true,
                            iconEnabledColor: ColorUtils.grey,
                            style:
                                TextStyle(color: ColorUtils.grey, fontSize: 16),
                            dropdownColor: ColorUtils.aliceBlue,
                            focusColor: ColorUtils.grey,
                            elevation: 0,
                            underline: SizedBox(),
                            // value: reqModel.countryCode,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: ConstUtils.kCountryCode.map((String items) {
                              return DropdownMenuItem(
                                child: Text(items),
                                value: items != null ? items : "",
                              );
                            }).toList(),
                            onChanged: (value) {
                              print('VALUE :$value');
                              //
                              // setState(() {
                              //   reqModel.countryCode = value as String;
                              // });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        child: CustomInputField(),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10.w,
                  ),
                  Text(
                    VariableUtils.addressLocation,
                    style: FontTextStyle.GorditaW5S14darkBlack.copyWith(
                        fontWeight: FontWeightClass.bold, fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  CustomInputField(
                    fieldName: 'Address 1',
                    onChange: (value) {
                      // reqModel.housePlot = value;
                    },
                    validator: (str) {
                      if (str!.isEmpty) {
                        return '* Is Required';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  CustomInputField(
                    fieldName: 'Address 2',
                    onChange: (value) {
                      // reqModel.housePlot = value;
                    },
                    validator: (str) {
                      if (str!.isEmpty) {
                        return '* Is Required';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomInputField(
                          fieldName: 'City',
                          // onChange: (value) {
                          //   reqModel.city = value;
                          // },
                          validator: (str) {
                            if (str!.isEmpty) {
                              return '* Is Required';
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        child: CustomInputField(
                          fieldName: 'State',
                          // onChange: (value) {
                          //   reqModel.state = value;
                          // },
                          validator: (str) {
                            if (str!.isEmpty) {
                              return '* Is Required';
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomInputField(
                          fieldName: 'Country',
                          onChange: (value) {
                            // reqModel.city = value;
                          },
                          validator: (str) {
                            if (str!.isEmpty) {
                              return '* Is Required';
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        child: CustomInputField(
                          fieldName: 'Zip Code',
                          fieldInputType: TextInputType.number,
                          validator: (str) {
                            if (str!.isEmpty) {
                              return '* Is Required';
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Text(
                    VariableUtils.documentations,
                    style: FontTextStyle.GorditaW5S14darkBlack.copyWith(
                        fontWeight: FontWeightClass.bold, fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.proofOfAddress,
                    style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                        fontWeight: FontWeightClass.bold),
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Text(
                    VariableUtils.addressProofSubtitle,
                    style: FontTextStyle.GorditaW5S10lightBlack,
                  ),
                  SizedBox(
                    height: 2.w,
                  ),

                  // controller.addressProf != ""
                  //     ? ListTile(
                  //   title: Text(ConstUtils.kGetFileName(controller.addressProf)),
                  //   trailing: TextButton(
                  //     onPressed: () async {
                  //       final file =
                  //       await PickFiles.getImage();
                  //       // if (file != '') {
                  //       //   viewModel.addressProf = file;
                  //       // }
                  //     },
                  //     child: Text('EDIT'),
                  //   ),
                  // )
                  //     :
                  CustomUploadButton(
                    icon: ImageUtils.uploadIcon1,
                    text: 'Upload Document',
                    onTap: () async {
                      // final file =
                      await PickFiles.getImage();
                      // if (file != '') {
                      //   viewModel.addressProf = file;
                      // }
                    },
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  CustomInputField(
                    fieldName: VariableUtils.license,
                    subTitle: Text(
                      VariableUtils.licenseSubtitle,
                      style: FontTextStyle.GorditaW5S10lightBlack,
                    ),
                    validator: (str) {
                      if (str!.isEmpty) {
                        return '* Is Required';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Text(
                    VariableUtils.Front,
                    style: FontTextStyle.GorditaW5S10lightBlack,
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  CustomInsurance(
                    image: ImageUtils.learnerPermitImg,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.back,
                    style: FontTextStyle.GorditaW5S10lightBlack,
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  CustomInsurance(
                    image: ImageUtils.sample,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    VariableUtils.autoInsurance,
                    style: FontTextStyle.GorditaW7S10darkBlack,
                  ),
                  Text(
                    VariableUtils.insuranceCopy,
                    style: FontTextStyle.GorditaW5S10lightBlack,
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  CustomInsurance(
                    image: ImageUtils.insurancePolicy,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  CustomButton(
                    height: 15.w,
                    width: 180.w,
                    onPressed: () {},
                    title: 'Save',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
