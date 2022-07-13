import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/image_utils.dart';

class CustomSearchData extends StatefulWidget {

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

  const CustomSearchData({Key? key,  this.fieldName,
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
    this.onChange}) : super(key: key);

  @override
  State<CustomSearchData> createState() => _CustomSearchDataState();
}

class _CustomSearchDataState extends State<CustomSearchData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.w,
      width: 17.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.w,),
        color: ColorUtils.white,
        border: Border.all(color: ColorUtils.grey.withOpacity(0.2))
       
      ),
      //color: ColorUtils.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(widget.fieldName ?? '',
                  style: FontTextStyle.GorditaW5S10lightBlack.copyWith(color: ColorUtils.black)),
            ),
            SizedBox(width: 2.w,),
            GestureDetector(
                onTap: (){
                },
                child: SvgPicture.asset(ImageUtils.cancel,height: 2.w,))
          ],
        ));
  }
}
