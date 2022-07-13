import 'package:flutter/material.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';

import '../../widgets/CustomeTextFormFeild.dart';

class RejectionReason extends StatefulWidget {
  const RejectionReason({Key? key}) : super(key: key);

  @override
  State<RejectionReason> createState() => _RejectionReasonState();
}

class _RejectionReasonState extends State<RejectionReason> {
  int val = -1;
  TextEditingController _vehicle = new TextEditingController();
  bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.w,
              ),
              Text(
                VariableUtils.selectReason,
                style: FontTextStyle.GorditaW5S12darkBlack.copyWith(
                    fontWeight: FontWeightClass.bold),
              ),
              SizedBox(
                height: 2.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    VariableUtils.jobRequestBy,
                    style: FontTextStyle.GorditaW5S12darkBlack.copyWith(
                        fontWeight: FontWeightClass.bold),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    VariableUtils.custName1,
                    style: FontTextStyle.GorditaW5S12darkBlack.copyWith(
                        fontWeight: FontWeightClass.bold,
                        color: ColorUtils.accent),
                  )
                ],
              )
            ],
          ),
        ),
        ListTile(
          title: Text("Vehicle mismatch",
              style: FontTextStyle.GorditaW5S12lightBlack),
          leading: Transform.scale(
            scale: 1.25.sp,
            child: Radio(
              // materialTapTargetSize: MaterialTapTargetSize.padded ,
              value: 1,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value as int;
                });
              },
              activeColor: ColorUtils.primaryColor,
            ),
          ),
        ),
        ListTile(
          title: Text("Distance so far",
              style: FontTextStyle.GorditaW5S12lightBlack),
          leading: Transform.scale(
            scale: 1.25.sp,
            child: Radio(
              value: 2,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value as int;
                });
              },
              activeColor: ColorUtils.primaryColor,
            ),
          ),
        ),
        ListTile(
          title: Text("Price to high",
              style: FontTextStyle.GorditaW5S12lightBlack),
          leading: Transform.scale(
            scale: 1.25.sp,
            child: Radio(
              value: 3,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value as int;
                });
              },
              activeColor: ColorUtils.primaryColor,
            ),
          ),
        ),
        ListTile(
          title: Text("Unreasonable time frame",
              style: FontTextStyle.GorditaW5S12lightBlack),
          leading: Transform.scale(
            scale: 1.25.sp,
            child: Radio(
              value: 4,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value as int;
                });
              },
              activeColor: ColorUtils.primaryColor,
            ),
          ),
        ),
        ListTile(
          title: Text("Others", style: FontTextStyle.GorditaW5S12lightBlack),
          leading: Transform.scale(
            scale: 1.25.sp,
            transformHitTests: false,
            child: SizedBox(
              child: Radio(
                value: 5,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = value as int;
                  });
                },
                activeColor: ColorUtils.primaryColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.w,
        ),
        val == 5
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: CustomInputField(
                  fieldName: "Write reason for rejection",
                  fieldController: _vehicle,
                ),
              )
            : Container(),
        SizedBox(
          height: 5.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 20.w,
                width: double.infinity,
                decoration: BoxDecoration(color: ColorUtils.darkBlack),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.w,
                    ),
                    Text(
                      VariableUtils.done,
                      style: FontTextStyle.GorditaW5S12lightBlack.copyWith(
                          color: ColorUtils.primaryColor,
                          fontWeight: FontWeightClass.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
