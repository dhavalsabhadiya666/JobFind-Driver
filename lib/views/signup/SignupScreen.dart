import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/common/debit_cart_input_format.dart';
import 'package:telescope_driver/common/loading_view.dart';
import 'package:telescope_driver/common/pick_files.dart';
import 'package:telescope_driver/common/show_toast.dart';
import 'package:telescope_driver/model/apiModel/requestModel/register_req_model.dart';
import 'package:telescope_driver/model/apiModel/responseModel/register_res_model.dart';
import 'package:telescope_driver/model/repo/file_upload_repo.dart';
import 'package:telescope_driver/utils/const_utils.dart';
import 'package:telescope_driver/utils/enum_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/pref_manager_utils.dart';
import 'package:telescope_driver/utils/validation_utils.dart';
import 'package:telescope_driver/viewmodel/auth_viewmodel.dart';
import 'package:telescope_driver/views/signup/vehicle_type.dart';
import '../../utils/color_utils.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/variable_utils.dart';
import '../../widgets/CustomeTextFormFeild.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_round_button.dart';
import '../../widgets/custon_uploadbutton.dart';
import '../../widgets/custombutton.dart';
import '../login/Login_screen.dart';
import 'OTP_VerificationScreen.dart';

class VehicleTypeModel {
  final String? title;
  final String? img;

  VehicleTypeModel({required this.title, required this.img});
}

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  RegisterReqModel reqModel = RegisterReqModel();

  var initialValue = "+1";

  AuthViewModel viewModel = Get.find();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    viewModel.clearData();
    reqModel.countryCode = initialValue;
    super.initState();
  }

  List<VehicleTypeModel> listVehicleType = [
    VehicleTypeModel(title: 'Bicycle', img: ImageUtils.bicycleImg),
    VehicleTypeModel(title: 'E-Bike', img: ImageUtils.eBikeImg),
    VehicleTypeModel(title: 'Motorcycle', img: ImageUtils.motorcycleImg),
    VehicleTypeModel(title: 'Fleet', img: ImageUtils.fleetImg),
    VehicleTypeModel(title: 'Box Truck', img: ImageUtils.boxTruckImg),
  ];

  String selectedVehicleType = '';
  bool isTermAndConditionStatus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: GetBuilder<AuthViewModel>(
          builder: (controller) {
            return Stack(
              children: [
                Scaffold(
                    backgroundColor: ColorUtils.white,
                    appBar: PreferredSize(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 4.w),
                        child:
                            //Text("data"),
                            CustomAppBar(
                          authName: 'Login',
                          // backIcon: ImageUtils.backIcon,
                          // backOnTap: () {
                          //   Navigator.pop(context);
                          // },
                          locationIcon: ImageUtils.locationIcon,
                          titleName: VariableUtils.title,
                          authOnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginscreen()));
                          },
                        ),
                      ),
                      preferredSize: Size.fromHeight(20.w),
                    ),
                    body: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    VariableUtils.signuptitle,
                                    style: FontTextStyle.GorditaW5S14darkBlack
                                        .copyWith(
                                            fontWeight: FontWeightClass.bold,
                                            fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  Text(
                                    VariableUtils.signupsubtitle,
                                    style: FontTextStyle.GorditaW5S12lightBlack,
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Stack(
                                    children: [
                                      controller.profilePic != ''
                                          ? CircleAvatar(
                                              backgroundColor: ColorUtils.blue,
                                              // foregroundImage:  AssetImage(ImageUtils.charge1),
                                              backgroundImage: FileImage(
                                                  File(controller.profilePic)),
                                              radius: 15.w,
                                            )
                                          : CircleAvatar(
                                              backgroundColor: ColorUtils.blue,
                                              // foregroundImage:  AssetImage(ImageUtils.charge1),
                                              backgroundImage: AssetImage(
                                                  ImageUtils.bottomprofile1),

                                              radius: 15.w,
                                            ),
                                      Positioned(
                                        bottom: 0.w,
                                        right: -1.w,
                                        child: GestureDetector(
                                            onTap: () async {
                                              final file =
                                                  await PickFiles.getImage();
                                              if (file != '') {
                                                viewModel.profilePic = file;
                                              }
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
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: CustomInputField(
                                        // fieldController: _fname,
                                        onChange: (value) {
                                          reqModel.fstName = value;
                                        },
                                        inputFormat: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(RegularExpression
                                                  .alphabetPattern))
                                        ],
                                        fieldName: 'First Name',
                                        validator: (str) {
                                          if (str!.isEmpty) {
                                            return '* Is Required';
                                          }

                                          return null;
                                        },
                                      )),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Expanded(
                                          child: CustomInputField(
                                        // fieldController: _lastname,
                                        fieldName: 'Last Name',
                                        onChange: (value) {
                                          reqModel.lstName = value;
                                        },
                                        inputFormat: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(RegularExpression
                                                  .alphabetPattern))
                                        ],
                                        validator: (str) {
                                          if (str!.isEmpty) {
                                            return '* Is Required';
                                          }

                                          return null;
                                        },
                                      )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  CustomInputField(
                                    fieldName: 'Email Address',
                                    onChange: (value) {
                                      reqModel.email = value;
                                    },
                                    inputFormat: [
                                      FilteringTextInputFormatter.allow(RegExp(
                                          RegularExpression.emailPattern))
                                    ],

                                    validator: (value) {
                                      bool regex = new RegExp(RegularExpression
                                              .emailValidationPattern)
                                          .hasMatch(value!);
                                      if (value.isEmpty) {
                                        return '* Is Required';
                                      } else if (regex == false) {
                                        return "Please Enter Valid Email";
                                      }

                                      return null;
                                    },
                                    // fieldController: _email
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Text(VariableUtils.oldPhNumber,
                                      style:
                                          FontTextStyle.GorditaW7S10darkBlack),
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
                                            borderRadius:
                                                BorderRadius.circular(4.5),
                                          ),
                                          //margin: EdgeInsets.symmetric(horizontal: 20),
                                          child: DropdownButton(
                                            // isExpanded: true,
                                            iconEnabledColor: ColorUtils.grey,
                                            style: TextStyle(
                                                color: ColorUtils.grey,
                                                fontSize: 16),
                                            dropdownColor: ColorUtils.aliceBlue,
                                            focusColor: ColorUtils.grey,
                                            elevation: 0,
                                            underline: SizedBox(),
                                            value: reqModel.countryCode,
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
                                            items: ConstUtils.kCountryCode
                                                .map((String items) {
                                              return DropdownMenuItem(
                                                child: Text(items),
                                                value:
                                                    items != null ? items : "",
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              print('VALUE :$value');

                                              setState(() {
                                                reqModel.countryCode =
                                                    value as String;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Expanded(
                                          child: CustomInputField(
                                        // fieldController: _phone,
                                        fieldInputType: TextInputType.number,
                                        onChange: (value) {
                                          reqModel.pNumber = value;
                                        },
                                        inputFormat: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(RegularExpression
                                                  .digitsPattern))
                                        ],
                                        // validator: (str) {
                                        //   if (str!.isEmpty) {
                                        //     return '* Is Required';
                                        //   }
                                        //
                                        //   return null;
                                        // },
                                      )),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Text(
                                    VariableUtils.addressLocation,
                                    style: FontTextStyle.GorditaW5S14darkBlack
                                        .copyWith(
                                            fontWeight: FontWeightClass.bold,
                                            fontSize: 14.sp),
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
                                  // SizedBox(
                                  //   height: 5.w,
                                  // ),
                                  // CustomInputField(
                                  //   fieldName:
                                  //       'House/plot no.,street name,area',
                                  //   onChange: (value) {
                                  //     reqModel.housePlot = value;
                                  //   },
                                  //   validator: (str) {
                                  //     if (str!.isEmpty) {
                                  //       return '* Is Required';
                                  //     }
                                  //
                                  //     return null;
                                  //   },
                                  // ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomInputField(
                                          fieldName: 'City',
                                          onChange: (value) {
                                            reqModel.city = value;
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
                                          fieldName: 'State',
                                          onChange: (value) {
                                            reqModel.state = value;
                                          },
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
                                          onChange: (value) {
                                            reqModel.zipCode = value;
                                          },
                                          fieldInputType: TextInputType.number,
                                          inputFormat: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(RegularExpression
                                                    .digitsPattern))
                                          ],
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
                                  CustomInputField(
                                    fieldName: 'Password',
                                    // fieldController: _pass,
                                    obscureText: true,
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  CustomInputField(
                                    fieldName: 'Confirm Password',
                                    // fieldController: _pass,
                                    obscureText: true,
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Text(
                                    VariableUtils.documentations,
                                    style: FontTextStyle.GorditaW5S14darkBlack
                                        .copyWith(
                                            fontWeight: FontWeightClass.bold,
                                            fontSize: 14.sp),
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Text(
                                    VariableUtils.proofOfAddress,
                                    style: FontTextStyle.GorditaW7S10darkBlack
                                        .copyWith(
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

                                  controller.addressProf != ""
                                      ? ListTile(
                                          title: Text(ConstUtils.kGetFileName(
                                              controller.addressProf)),
                                          trailing: TextButton(
                                            onPressed: () async {
                                              final file =
                                                  await PickFiles.getImage();
                                              if (file != '') {
                                                viewModel.addressProf = file;
                                              }
                                            },
                                            child: Text('EDIT'),
                                          ),
                                        )
                                      : CustomUploadButton(
                                          icon: ImageUtils.uploadIcon1,
                                          text: 'Upload Document',
                                          onTap: () async {
                                            final file =
                                                await PickFiles.getImage();
                                            if (file != '') {
                                              viewModel.addressProf = file;
                                            }
                                          },
                                        ),
                                  // SizedBox(
                                  //   height: 3.w,
                                  // ),
                                  // CustomInputField(
                                  //   fieldName: 'Email Address',
                                  //   onChange: (value) {
                                  //     reqModel.email = value;
                                  //   },
                                  //   inputFormat: [
                                  //     FilteringTextInputFormatter.allow(
                                  //         RegExp(RegularExpression
                                  //             .alphabetPattern))
                                  //   ],
                                  //   validator: (str) {
                                  //     if (str!.isEmpty) {
                                  //       return '* Is Required';
                                  //     }
                                  //
                                  //     return null;
                                  //   },
                                  // ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  CustomInputField(
                                    fieldName: VariableUtils.license,
                                    subTitle: Text(
                                      VariableUtils.licenseSubtitle,
                                      style:
                                          FontTextStyle.GorditaW5S10lightBlack,
                                    ),
                                    onChange: (value) {
                                      reqModel.licenseNo = value;
                                    },
                                    inputFormat: [
                                      FilteringTextInputFormatter.allow(RegExp(
                                          RegularExpression
                                              .alphabetDigitsPattern))
                                    ],
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
                                  controller.licenseFrontImg != ""
                                      ? ListTile(
                                          title: Text(ConstUtils.kGetFileName(
                                              controller.licenseFrontImg)),
                                          trailing: TextButton(
                                            onPressed: () async {
                                              final file =
                                                  await PickFiles.getImage();
                                              if (file != '') {
                                                viewModel.licenseFrontImg =
                                                    file;
                                              }
                                            },
                                            child: Text('EDIT'),
                                          ),
                                        )
                                      : CustomUploadButton(
                                          icon: ImageUtils.uploadIcon1,
                                          text: 'Upload Front Side',
                                          onTap: () async {
                                            final file =
                                                await PickFiles.getImage();
                                            if (file != '') {
                                              viewModel.licenseFrontImg = file;
                                            }
                                          },
                                        ),
                                  SizedBox(
                                    height: 3.w,
                                  ),

                                  controller.licenseBackImg != ""
                                      ? ListTile(
                                          title: Text(ConstUtils.kGetFileName(
                                              controller.licenseBackImg)),
                                          trailing: TextButton(
                                            onPressed: () async {
                                              final file =
                                                  await PickFiles.getImage();
                                              if (file != '') {
                                                viewModel.licenseBackImg = file;
                                              }
                                            },
                                            child: Text('EDIT'),
                                          ),
                                        )
                                      : CustomUploadButton(
                                          icon: ImageUtils.uploadIcon1,
                                          text: 'Upload Back Side',
                                          onTap: () async {
                                            final file =
                                                await PickFiles.getImage();
                                            if (file != '') {
                                              viewModel.licenseBackImg = file;
                                            }
                                          },
                                        ),
                                  SizedBox(
                                    height: 7.w,
                                  ),

                                  Text('Upload License Plate',
                                      style:
                                          FontTextStyle.GorditaW7S10darkBlack),
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  Text(
                                    VariableUtils.licenseSubtitle,
                                    style: FontTextStyle.GorditaW5S10lightBlack,
                                  ),

                                  SizedBox(
                                    height: 3.w,
                                  ),
                                  controller.licensePlate != ""
                                      ? ListTile(
                                          title: Text(ConstUtils.kGetFileName(
                                              controller.licensePlate)),
                                          trailing: TextButton(
                                            onPressed: () async {
                                              final file =
                                                  await PickFiles.getImage();
                                              if (file != '') {
                                                viewModel.licensePlate = file;
                                              }
                                            },
                                            child: Text('EDIT'),
                                          ),
                                        )
                                      : CustomUploadButton(
                                          icon: ImageUtils.uploadIcon1,
                                          text: 'Upload Document',
                                          onTap: () async {
                                            final file =
                                                await PickFiles.getImage();
                                            if (file != '') {
                                              viewModel.licensePlate = file;
                                            }
                                          },
                                        ),

                                  SizedBox(
                                    height: 7.w,
                                  ),

                                  Text(
                                    VariableUtils.autoInsurance,
                                    style: FontTextStyle.GorditaW7S10darkBlack,
                                  ),
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  Text(
                                    VariableUtils.insuranceCopy,
                                    style: FontTextStyle.GorditaW5S10lightBlack,
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  controller.insurance != ""
                                      ? ListTile(
                                          title: Text(ConstUtils.kGetFileName(
                                              controller.insurance)),
                                          trailing: TextButton(
                                            onPressed: () async {
                                              final file =
                                                  await PickFiles.getImage();
                                              if (file != '') {
                                                viewModel.insurance = file;
                                              }
                                            },
                                            child: Text('EDIT'),
                                          ),
                                        )
                                      : CustomUploadButton(
                                          icon: ImageUtils.uploadIcon1,
                                          text: 'Upload Document',
                                          onTap: () async {
                                            final file =
                                                await PickFiles.getImage();
                                            if (file != '') {
                                              viewModel.insurance = file;
                                            }
                                          },
                                        ),

                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Text(
                                    VariableUtils.creditCard,
                                    style: FontTextStyle.GorditaW5S12darkBlack
                                        .copyWith(
                                            fontWeight: FontWeightClass.bold,
                                            fontSize: 14.sp),
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                ],
                              ),
                            ),
                            // CustomChargeButton(icon:ImageUtils.charge , text: VariableUtils.creditcharge,style: FontTextStyle.GorditaW5S10lightBlack,),
                            Container(
                              padding: EdgeInsets.all(2.w),
                              // width: 200.w,
                              // height: 14.w,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(2.w),
                                color: ColorUtils.accent,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // CustomUploadButton(icon: ImageUtils.uploadIcon1, text: '',),
                                  // CircleAvatar(
                                  //   child: SvgPicture.asset(ImageUtils.charge,color: ColorUtils.primaryColor,fit: BoxFit.cover,),
                                  //   backgroundColor: ColorUtils.white,
                                  // ),
                                  Container(
                                    // height: 12.w,
                                    padding: EdgeInsets.all(2.w),
                                    decoration: BoxDecoration(
                                      color: ColorUtils.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      ImageUtils.charge,
                                      fit: BoxFit.cover,
                                      height: 5.w,
                                      width: 3.w,
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Flexible(
                                    child: Text(VariableUtils.creditCharge,
                                        style:
                                            FontTextStyle.GorditaW5S10lightBlack
                                                .copyWith(
                                                    color: ColorUtils.white,
                                                    fontWeight:
                                                        FontWeightClass.bold)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  CustomInputField(
                                    fieldName: 'Card number',
                                    inputFormat: [
                                      MaskedTextInputFormatter(
                                        mask: 'xxxx-xxxx-xxxx-xxxx',
                                        separator: '-',
                                      ),
                                      // FilteringTextInputFormatter.allow(RegExp(
                                      //     RegularExpression.digitsPatternSpace))
                                    ],
                                    fieldInputType: TextInputType.number,
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: controller.imgOfCardType,
                                    ),
                                    validator: (str) {
                                      if (str!.isEmpty) {
                                        return '* Is Required';
                                      }

                                      return null;
                                    },
                                    onChange: (value) {
                                      reqModel.cardNo = value;
                                      viewModel.getCardImageAccordingToCardType(
                                          value);
                                    },
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: CustomInputField(
                                        fieldName: 'Exp. Date',
                                        onChange: (value) {
                                          reqModel.expDate = value;
                                        },
                                        fieldInputType:
                                            TextInputType.numberWithOptions(
                                                signed: true),
                                        validator: (str) {
                                          if (str!.isEmpty) {
                                            return '* Is Required';
                                          }

                                          return null;
                                        },
                                        inputFormat: [
                                          CardExpirationFormatter(),
                                          // FilteringTextInputFormatter.allow(
                                          //     RegExp(RegularExpression
                                          //         .digitsPatternForwardSlash))
                                        ],
                                      )),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Expanded(
                                          child: CustomInputField(
                                        onChange: (value) {
                                          reqModel.securityCode = value;
                                        },
                                        fieldInputType: TextInputType.number,
                                        inputFormat: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(RegularExpression
                                                  .digitsPattern))
                                        ],
                                        validator: (str) {
                                          if (str!.isEmpty) {
                                            return '* Is Required';
                                          }

                                          return null;
                                        },
                                        fieldName: 'Security Code',
                                      )),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 10.w,
                                  // ),
                                  // CustomButton(
                                  //   width: 180.w,
                                  //   onPressed: () {},
                                  //   title: 'Add Card',
                                  // ),

                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Text(
                                    'Your Vehicle',
                                    style: FontTextStyle.GorditaW5S14darkBlack
                                        .copyWith(
                                            fontWeight: FontWeightClass.bold,
                                            fontSize: 14.sp),
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Text(
                                    'Vehicle Photo',
                                    style: FontTextStyle.GorditaW7S10darkBlack
                                        .copyWith(
                                            fontWeight: FontWeightClass.bold),
                                  ),
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  Text(
                                    'Attach a photo of your Vehicle',
                                    style: FontTextStyle.GorditaW5S10lightBlack,
                                  ),
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  controller.vehiclePhoto != ""
                                      ? ListTile(
                                          title: Text(ConstUtils.kGetFileName(
                                              controller.vehiclePhoto)),
                                          trailing: TextButton(
                                            onPressed: () async {
                                              final file =
                                                  await PickFiles.getImage();
                                              if (file != '') {
                                                viewModel.vehiclePhoto = file;
                                              }
                                            },
                                            child: Text('EDIT'),
                                          ),
                                        )
                                      : CustomUploadButton(
                                          icon: ImageUtils.uploadIcon1,
                                          text: 'Upload Photo',
                                          onTap: () async {
                                            final file =
                                                await PickFiles.getImage();
                                            if (file != '') {
                                              viewModel.vehiclePhoto = file;
                                            }
                                          },
                                        ),
                                  SizedBox(
                                    height: 7.w,
                                  ),
                                  Text(
                                    'Vehicle Type',
                                    style: FontTextStyle.GorditaW7S10darkBlack
                                        .copyWith(
                                            fontWeight: FontWeightClass.bold),
                                  ),
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  Text(
                                    'Select which type of vehicle you are using for delivery',
                                    style: FontTextStyle.GorditaW5S10lightBlack,
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  GridView(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 10,
                                            childAspectRatio: 1.1,
                                            mainAxisSpacing: 10),
                                    children: listVehicleType
                                        .map((e) => InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedVehicleType =
                                                      e.title!;
                                                });
                                              },
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: selectedVehicleType ==
                                                                e.title!
                                                            ? ColorUtils
                                                                .primaryColor
                                                            : Color(0xff0000004)
                                                                .withOpacity(
                                                                    0.1))),
                                                child: Stack(
                                                  children: [
                                                    Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 5),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
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
                                    height: 10.w,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Other?',
                                        style:
                                            FontTextStyle.GorditaW7S10darkBlack,
                                      ),
                                      Spacer(),
                                      Text(
                                        'Yes',
                                        style: FontTextStyle
                                            .GorditaW5S10lightBlack,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedVehicleType = 'Yes';
                                            });
                                          },
                                          child: checkBox('Yes')),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  CustomInputField(
                                    onChange: (value) {
                                      // reqModel.housePlot = value;
                                    },
                                    enabled: selectedVehicleType == 'Yes',
                                    validator: (str) {
                                      if (str!.isEmpty) {
                                        return '* Is Required';
                                      }

                                      return null;
                                    },
                                  ),
                                  // Column(
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.start,
                                  //   children: [
                                  //     Text(
                                  //       VariableUtils.vehicle1,
                                  //       style:
                                  //           FontTextStyle.GorditaW5S12darkBlack
                                  //               .copyWith(
                                  //                   fontWeight:
                                  //                       FontWeightClass.bold,
                                  //                   fontSize: 14.sp),
                                  //     ),
                                  //     SizedBox(
                                  //       height: 5.w,
                                  //     ),
                                  //     VehicleType(
                                  //       onChange: (value) {
                                  //         reqModel.vehicleType =
                                  //             ConstUtils.kGetVehicleType(value);
                                  //       },
                                  //       onChangeStr: (value) {
                                  //         reqModel.nameOfVehicle = value;
                                  //       },
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 5.w,
                                  // ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isTermAndConditionStatus =
                                                !isTermAndConditionStatus;
                                          });
                                        },
                                        child: Container(
                                          height: 21,
                                          width: 21,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: !isTermAndConditionStatus
                                                  ? Colors.transparent
                                                  : Color(0xffEAFDE6),
                                              border: Border.all(
                                                  color: Color(0xffB3BDC4))),
                                          child: !isTermAndConditionStatus
                                              ? SizedBox()
                                              : Center(
                                                  child: Icon(Icons.check,
                                                      size: 17,
                                                      color:
                                                          Color(0xffB3BDC4))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: 'Accept our  ',
                                          style: FontTextStyle
                                              .GorditaW5S10lightBlack,
                                        ),
                                        TextSpan(
                                            text: 'Terms & Conditions',
                                            style: FontTextStyle
                                                    .GorditaW7S10darkBlack
                                                .copyWith(
                                                    decoration: TextDecoration
                                                        .underline))
                                      ])),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  CustomRoundButton(
                                    onTap: onTap,
                                    icon: ImageUtils.forwardIcon,
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                ],
                              ),
                            ),

                            /// add green forword button
                          ],
                        ),
                      ),
                    )),
                if (controller.registerApiResponse.status == Status.LOADING)
                  LoadingView.postLoadingView()
              ],
            );
          },
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

  Future<void> onTap() async {
    Get.to(OTPVarification(
      // userId: userId ?? '11',
      otp: '1111',
      pNumber: '1234567890',
    ));

    return;
    if (formKey.currentState!.validate()) {
      print('CALL..');
      if (reqModel.pNumber == null || reqModel.pNumber == '') {
        showToast(title: 'Phone number required');
        return;
      }
      if (viewModel.profilePic == '') {
        showToast(title: 'Profile pic required');
        return;
      }
      if (viewModel.addressProf == '') {
        showToast(title: 'Address proof required');
        return;
      }
      if (viewModel.licenseFrontImg == '') {
        showToast(title: 'License front pic required');
        return;
      }
      if (viewModel.licenseBackImg == '') {
        showToast(title: 'License back pic required');
        return;
      }

      if (viewModel.insurance == '') {
        showToast(title: 'Insurance pic required');
        return;
      }
      if (reqModel.vehicleType == null) {
        showToast(title: 'Vehicle type required');
        return;
      }

      viewModel.setLoading();

      /// UPLOAD PROFILE IMAGE
      if (reqModel.image == null) {
        final data =
            await UploadFileRepo().uploadFileRepo(file: viewModel.profilePic);
        if (data != null) {
          if (data.sucecess == true) {
            reqModel.image = data.data!.filepathUrl;
          } else {
            viewModel.setError();
            return;
          }
        } else {
          viewModel.setError();
          return;
        }
      }

      /// UPLOAD LICENCE FRONT IMAGE
      if (reqModel.licenseFrontImg == null) {
        final data = await UploadFileRepo()
            .uploadFileRepo(file: viewModel.licenseFrontImg);
        if (data != null) {
          if (data.sucecess == true) {
            reqModel.licenseFrontImg = data.data!.filepathUrl;
          } else {
            viewModel.setError();
            return;
          }
        } else {
          viewModel.setError();
          return;
        }
      }

      /// UPLOAD LICENCE BACK IMAGE
      if (reqModel.licenseBackImg == null) {
        final data = await UploadFileRepo()
            .uploadFileRepo(file: viewModel.licenseBackImg);
        if (data != null) {
          if (data.sucecess == true) {
            reqModel.licenseBackImg = data.data!.filepathUrl;
          } else {
            viewModel.setError();
            return;
          }
        } else {
          viewModel.setError();
          return;
        }
      }

      /// UPLOAD ADDRESS PROOF IMAGE
      if (reqModel.addressProf == null) {
        final data =
            await UploadFileRepo().uploadFileRepo(file: viewModel.addressProf);
        if (data != null) {
          if (data.sucecess == true) {
            reqModel.addressProf = data.data!.filepathUrl;
          } else {
            viewModel.setError();
            return;
          }
        } else {
          viewModel.setError();
          return;
        }
      }

      /// UPLOAD INSURANCE IMAGE
      if (reqModel.insuranceDoc == null) {
        final data =
            await UploadFileRepo().uploadFileRepo(file: viewModel.insurance);
        if (data != null) {
          if (data.sucecess == true) {
            reqModel.insuranceDoc = data.data!.filepathUrl;
          } else {
            viewModel.setError();
            return;
          }
        } else {
          viewModel.setError();
          return;
        }
      }

      await viewModel.register(reqModel);
      if (viewModel.registerApiResponse.status == Status.COMPLETE) {
        RegisterResModel response = viewModel.registerApiResponse.data;
        if (response.sucecess == true) {
          showToast(
              title: 'OTP send to your number, OTP IS ${response.data!.otp!}',
              status: true);
          // String? userId;
          if (response.message != 'OTP resend successfully') {
            await PrefManagerUtils.setUserData(
                jsonEncode(response.data!.toJson()));
            // userId = response.data!.id!;
          } else {
            // userId = ConstUtils.kGetUserData().id;
          }

          log('USER DATA :${PrefManagerUtils.getUserData()}');
          formKey.currentState!.reset();
          viewModel.clearData();
          Get.to(OTPVarification(
            // userId: userId ?? '11',
            otp: response.data!.otp!,
            pNumber: reqModel.countryCode! + ' ' + reqModel.pNumber!,
          ));
        } else {
          // showToast(title: 'Sign up failed');
          showToast(title: response.message ?? 'Sign up failed');
        }
      } else {
        showToast(title: VariableUtils.somethingWantWrong);
      }
    }
  }
}
