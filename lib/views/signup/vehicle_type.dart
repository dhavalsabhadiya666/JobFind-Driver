import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/typedef_utils.dart';
import 'package:telescope_driver/utils/validation_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import '../../widgets/CustomeTextFormFeild.dart';

class VehicleType extends StatefulWidget {
  const VehicleType(
      {Key? key, required this.onChange, required this.onChangeStr})
      : super(key: key);
  final OnChangeInt onChange;
  final ValueChanged<String?> onChangeStr;

  @override
  State<VehicleType> createState() => _VehicleTypeState();
}

class _VehicleTypeState extends State<VehicleType> {
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(VariableUtils.twoWheeler,
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
                widget.onChange(val);
              },
              activeColor: ColorUtils.primaryColor,
            ),
          ),
        ),
        ListTile(
          title: Text(VariableUtils.smallTruck,
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
                widget.onChange(val);
              },
              activeColor: ColorUtils.primaryColor,
            ),
          ),
        ),
        ListTile(
          title: Text(VariableUtils.car,
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
                widget.onChange(val);
              },
              activeColor: ColorUtils.primaryColor,
            ),
          ),
        ),
        ListTile(
          title: Text(VariableUtils.midSizeTruck,
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
                widget.onChange(val);
              },
              activeColor: ColorUtils.primaryColor,
            ),
          ),
        ),
        ListTile(
          title: Text(VariableUtils.others,
              style: FontTextStyle.GorditaW5S12lightBlack),
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
                  widget.onChange(val);
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
            ? CustomInputField(
                fieldName: "Name of your Vehicle",
                onChange: widget.onChangeStr,
                inputFormat: [
                  FilteringTextInputFormatter.allow(
                      RegExp(RegularExpression.alphabetPattern))
                ],
              )
            : Container(),
      ],
    );
  }
}
