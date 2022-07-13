// FONT FAMILY
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'color_utils.dart';

const String gorditaFamily = "Gordita";
const String gilroyFamily = "Gilroy";

//FONT WEIGHT

class FontWeightClass {
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiB = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraB = FontWeight.w800;
  static const black = FontWeight.w900;
}

/// FONT TEXT STYLE

class FontTextStyle {
  // Title
  static TextStyle gilroyW7S207darkGrey = TextStyle(
      fontFamily: gilroyFamily,
      fontSize: 40.sp,
      color: ColorUtils.darkGrey,
      fontWeight: FontWeightClass.bold);

  static TextStyle gilroyW7Sp14darkAccent = TextStyle(
      fontFamily: gilroyFamily,
      fontSize: 14.sp,
      color: ColorUtils.accent,
      fontWeight: FontWeightClass.bold);

  static TextStyle gilroyW715sp7white = TextStyle(
      fontFamily: gilroyFamily,
      fontSize: 15.sp,
      color: ColorUtils.white,
      fontWeight: FontWeightClass.bold);
  static TextStyle gilroyW720sp7white =
      gilroyW715sp7white.copyWith(fontSize: 20.sp);
  static TextStyle gilroyW710sp7white =
      gilroyW715sp7white.copyWith(fontSize: 10.sp);

  static TextStyle gilroyW7S147darkGrey =
      gilroyW7S207darkGrey.copyWith(fontSize: 14.sp);

  static TextStyle gilroyW7S147darkBlack =
      gilroyW7S147darkGrey.copyWith(fontFamily: gilroyFamily, fontSize: 24.sp);
  static TextStyle gilroyW7S14darkBlack = gilroyW7S147darkGrey.copyWith(
    fontFamily: gilroyFamily,
    fontSize: 14.sp,
  );
  static TextStyle gilroyW7S13darkBlack = gilroyW7S147darkGrey.copyWith(
    fontFamily: gilroyFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle gilroyW7S16darkBlack = gilroyW7S147darkGrey.copyWith(
    fontFamily: gilroyFamily,
    fontSize: 16.sp,
  );

//10
  static TextStyle GorditaW7S10darkBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 10.sp,
      color: ColorUtils.darkBlack,
      fontWeight: FontWeightClass.bold);

  static TextStyle GorditaW5S10darkBlack =
      GorditaW7S10darkBlack.copyWith(fontWeight: FontWeightClass.medium);
  static TextStyle GorditaW6S10darkBlack =
      GorditaW7S10darkBlack.copyWith(fontWeight: FontWeightClass.semiB);

  static TextStyle GorditaW5S10lightBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 10.sp,
      color: ColorUtils.lightBlack.withOpacity(0.5),
      fontWeight: FontWeightClass.medium);

  static TextStyle gilroyW7S24darkBlack =
      GorditaW7S10darkBlack.copyWith(fontSize: 20.sp);
  static TextStyle gilroyW7S12primaryColor = gilroyW7S24darkBlack.copyWith(
    color: ColorUtils.primaryColor,
    fontSize: 12.sp,
  );

  static TextStyle GorditaW7S24darkBlack =
      gilroyW7S24darkBlack.copyWith(fontFamily: gorditaFamily);

//12 dark black
  static TextStyle GorditaW7S12darkBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 12.sp,
      color: ColorUtils.darkBlack,
      fontWeight: FontWeightClass.bold);
  static TextStyle GorditaW6S12darkBlack =
      GorditaW6S10darkBlack.copyWith(fontSize: 12.sp);

//12
  static TextStyle GorditaW5S12lightBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 12.sp,
      color: ColorUtils.lightBlack,
      fontWeight: FontWeightClass.medium);

  //14
  static TextStyle GorditaW5S14lightBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 14.sp,
      color: ColorUtils.lightBlack,
      fontWeight: FontWeightClass.medium);
  static TextStyle GorditaW5S14darkBlack =
      GorditaW5S14lightBlack.copyWith(color: ColorUtils.darkBlack);
  static TextStyle GorditaW5S12darkBlack =
      GorditaW5S14darkBlack.copyWith(fontSize: 12.sp);

  //18
  static TextStyle GorditaW5S18lightBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 18.sp,
      color: ColorUtils.lightBlack,
      fontWeight: FontWeightClass.medium);

  static TextStyle GorditaW7S18darkBlack = GorditaW5S18lightBlack.copyWith(
      color: ColorUtils.darkBlack, fontWeight: FontWeightClass.bold);

  //12 with underline text
  static TextStyle GorditaW5S12darkBlackunderline = TextStyle(
      decoration: TextDecoration.underline,
      fontFamily: gorditaFamily,
      fontSize: 12.sp,
      color: ColorUtils.darkBlack,
      fontWeight: FontWeightClass.medium);
  //25
  static TextStyle GorditaW5S25lightBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 20.sp,
      color: ColorUtils.lightBlack,
      fontWeight: FontWeightClass.medium);

  static TextStyle GorditaW5S25darkBlack = TextStyle(
      fontFamily: gorditaFamily,
      fontSize: 20.sp,
      color: ColorUtils.darkBlack,
      fontWeight: FontWeightClass.extraB);
}
