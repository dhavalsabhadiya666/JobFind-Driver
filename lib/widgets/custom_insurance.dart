import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';

class CustomInsurance extends StatelessWidget {
  String? image;
  CustomInsurance({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 55.w,
          width: 180.w,
          color: ColorUtils.aliceBlue,
          child: Image.asset(
            image!,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 4.w,
              backgroundColor: ColorUtils.white,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Image.asset(
                  ImageUtils.editIcon,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            CircleAvatar(
              radius: 4.w,
              backgroundColor: ColorUtils.white,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  ImageUtils.arrow,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
          ],
        )
      ],
    );
  }
}
