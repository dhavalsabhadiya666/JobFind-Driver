import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/font_style_utils.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController fieldController;

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
  final double height;
  const CustomFormField({
    Key? key,
    this.height = kToolbarHeight,
    this.textCapitalization,
    this.bgColor,
    this.fieldInputType,
    required this.fieldController,
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
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.5),
        color: widget.bgColor ?? ColorUtils.aliceBlue,
      ),
      height: widget.height,
      child: TextFormField(
          style: TextStyle(fontSize: 12.sp),
          controller: widget.fieldController,
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
          decoration: InputDecoration(
            hintText: widget.hint ?? "",
            hintStyle: FontTextStyle.GorditaW5S12lightBlack,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.w, horizontal: 2.w),
            isDense: true,
            border: InputBorder.none,

            prefixIconConstraints: BoxConstraints(minWidth: 30, maxHeight: 20),
            //  hintStyle: ColorUtils.,
          )),
    );
  }
}
