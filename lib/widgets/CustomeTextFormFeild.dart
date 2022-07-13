import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/typedef_utils.dart';

import '../utils/font_style_utils.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController? fieldController;
  final String? fieldName;
  final TextCapitalization? textCapitalization;
  final String? hint;
  final TextInputType? fieldInputType;
  final bool? enabled;
  final Color? bgColor;
  final int? maxLines;
  final int? maxLength;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onChange;
  final ValueChanged<String?>? onSave;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final double? contentpadding;
  final List<TextInputFormatter>? inputFormat;
  final Widget? subTitle;

  const CustomInputField({
    Key? key,
    this.fieldName,
    this.textCapitalization,
    this.bgColor,
    this.fieldInputType,
    this.fieldController,
    this.enabled,
    this.maxLines,
    this.maxLength,
    this.validator,
    this.onTap,
    this.onSave,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.contentpadding,
    this.onChange,
    this.inputFormat,
    this.subTitle,
  }) : super(key: key);

  @override
  _CustomInputField_State createState() => _CustomInputField_State();
}

class _CustomInputField_State extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //color: ColorUtils.red,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.fieldName != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.fieldName ?? '',
                style: FontTextStyle.GorditaW7S10darkBlack),
          ),
        if (widget.subTitle != null)
          Padding(
            padding: EdgeInsets.only(top: 2.w),
            child: widget.subTitle,
          ),
        if (widget.fieldName != null)
          SizedBox(
            height: 2.w,
          ),
        TextFormField(
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
            // controller: widget.fieldController,
            keyboardType: widget.fieldInputType ?? TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            enabled: widget.enabled ?? true,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            validator: widget.validator ?? null,
            obscureText: widget.obscureText ?? false,
            onTap: widget.onTap ?? null,
            onChanged: widget.onChange ?? null,
            onSaved: widget.onSave ?? null,
            inputFormatters: widget.inputFormat ?? [],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: widget.hint ?? "",
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,

              contentPadding:
                  EdgeInsets.symmetric(vertical: 3.w, horizontal: 2.w),
              fillColor: Color(0xffF6F8FA),
              filled: true,
              isDense: true,
              border: InputBorder.none,
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(8.0),
              // ),
              // focusedBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(8.0),
              //     borderSide: BorderSide(
              //         width: 1.5, color: ColorUtils.primaryColor)),
              suffixIconConstraints:
                  BoxConstraints(minWidth: 30, maxHeight: 20),
              prefixIconConstraints:
                  BoxConstraints(minWidth: 30, maxHeight: 20),
              //  hintStyle: ColorUtils.,
            )),
      ],
    ));
  }
}
