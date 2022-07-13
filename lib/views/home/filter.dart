import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:telescope_driver/utils/color_utils.dart';
import 'package:telescope_driver/utils/font_style_utils.dart';
import 'package:telescope_driver/utils/image_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/views/home/widgets/home_appbar_custom.dart';

class FilterBy extends StatefulWidget {
  const FilterBy({Key? key}) : super(key: key);

  @override
  State<FilterBy> createState() => _FilterByState();
}

class _FilterByState extends State<FilterBy> {
  TextEditingController _search = TextEditingController();
  int _selectedIndex = 0;

  List ls = ['Apply Filter', "Set as a Default"];
  List search = ['Baku', "Astara", "Quba"];
  List search1 = ["Sheki", "Mud Volcano"];

  SfRangeValues distanceValue = SfRangeValues(0.0, 10.0);
  SfRangeValues priceValue = SfRangeValues(0.0, 10.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              child: Container(
                color: ColorUtils.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.w),
                  child: CustomHomeAppbar(
                    backIcon: ImageUtils.backIcon,
                    backOnTap: () {
                      Navigator.pop(context);
                    },
                    titleName: VariableUtils.filter,
                  ),
                ),
              ),
              preferredSize: Size.fromHeight(17.w),
            ),
            backgroundColor: ColorUtils.aliceBlue,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                child: Column(
                  children: [
                    Container(
                      //  padding: EdgeInsets.all(3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'By Distance',
                                      style: FontTextStyle.GorditaW5S12darkBlack
                                          .copyWith(fontSize: 14.sp),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(2.w),
                                        // height: 5.w,
                                        // width: 17.w,
                                        decoration: BoxDecoration(
                                            color: ColorUtils.primaryLight,
                                            borderRadius:
                                                BorderRadius.circular(10.w)),
                                        child: Center(
                                            child: Text(
                                          VariableUtils.miles1,
                                          style: FontTextStyle
                                              .GorditaW5S10lightBlack.copyWith(
                                            color: ColorUtils.black,
                                          ),
                                        )))
                                  ],
                                ),
                                Text(
                                  VariableUtils.miles2,
                                  style: FontTextStyle.GorditaW5S12darkBlack
                                      .copyWith(fontSize: 14.sp),
                                ),
                                SizedBox(
                                  height: 3.w,
                                ),
                                SfRangeSelector(
                                  min: 0,
                                  max: 100,
                                  initialValues: distanceValue,
                                  interval: 1,
                                  endThumbIcon: SvgPicture.asset(
                                    ImageUtils.circle,
                                    height: 6.w,
                                  ),
                                  startThumbIcon: SvgPicture.asset(
                                    ImageUtils.circle,
                                    height: 6.w,
                                  ),
                                  activeColor: Color(0xff012239),
                                  child: SizedBox(
                                    width: Get.width,
                                  ),
                                  onChanged: (SfRangeValues rang) {
                                    setState(() {
                                      distanceValue = rang;
                                    });
                                  },
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(color: ColorUtils.white),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Container(
                            padding: EdgeInsets.all(3.w),
                            decoration: BoxDecoration(color: ColorUtils.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: FontTextStyle.GorditaW5S12darkBlack
                                      .copyWith(fontSize: 14.sp),
                                ),
                                TextField(
                                  controller: _search,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Location',
                                    fillColor: ColorUtils.aliceBlue,
                                    filled: true,
                                    prefixIconConstraints: BoxConstraints(
                                        minWidth: 30,
                                        minHeight: 30,
                                        maxHeight: 30,
                                        maxWidth: 30),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: SvgPicture.asset(
                                        ImageUtils.search,
                                        height: 4.w,
                                        width: 4.w,
                                        color: ColorUtils.black,
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 5),
                                    hintStyle: FontTextStyle
                                            .GorditaW5S12lightBlack
                                        .copyWith(
                                            color: ColorUtils.black,
                                            fontWeight: FontWeightClass.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.w,
                                ),
                                Container(
                                  height: 9.w,
                                  // width: 50.w,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: search.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              _selectedIndex = index;
                                            });
                                            print(index);
                                          },
                                          //   focusColor: Colors.redAccent,
                                          child: Container(
                                            // width: 40.w,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 1.w),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ColorUtils.grey
                                                      .withOpacity(0.2)),
                                              borderRadius:
                                                  BorderRadius.circular(1.w),
                                              color: ColorUtils.white,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.2.w),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          search[index],
                                                          style: FontTextStyle
                                                                  .GorditaW5S10lightBlack
                                                              .copyWith(
                                                                  color:
                                                                      ColorUtils
                                                                          .black),
                                                        ),
                                                        SizedBox(
                                                          width: 1.w,
                                                        ),
                                                        SvgPicture.asset(
                                                          ImageUtils.cancel,
                                                          height: 2.w,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 2.w,
                                ),
                                Container(
                                  height: 9.w,
                                  // width: 50.w,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: search1.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              _selectedIndex = index;
                                            });
                                            print(index);
                                          },
                                          //   focusColor: Colors.redAccent,
                                          child: Container(
                                            // width: 40.w,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 1.w),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ColorUtils.grey
                                                      .withOpacity(0.2)),
                                              borderRadius:
                                                  BorderRadius.circular(1.w),
                                              color: ColorUtils.white,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.2.w),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          search1[index],
                                                          style: FontTextStyle
                                                                  .GorditaW5S10lightBlack
                                                              .copyWith(
                                                                  color:
                                                                      ColorUtils
                                                                          .black),
                                                        ),
                                                        SizedBox(
                                                          width: 1.w,
                                                        ),
                                                        SvgPicture.asset(
                                                          ImageUtils.cancel,
                                                          height: 2.w,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Container(
                              padding: EdgeInsets.all(2.w),
                              decoration:
                                  BoxDecoration(color: ColorUtils.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        VariableUtils.priceRange,
                                        style:
                                            FontTextStyle.GorditaW5S12darkBlack
                                                .copyWith(fontSize: 14.sp),
                                      ),
                                      Container(
                                          padding: EdgeInsets.all(2.w),
                                          decoration: BoxDecoration(
                                              color: ColorUtils.primaryLight,
                                              borderRadius:
                                                  BorderRadius.circular(10.w)),
                                          child: Center(
                                              child: Text(
                                            '\$1-\$100',
                                            style: FontTextStyle
                                                    .GorditaW5S10lightBlack
                                                .copyWith(
                                                    color: ColorUtils.black),
                                          )))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  SfRangeSelector(
                                    min: 0,
                                    max: 100,
                                    initialValues: priceValue,
                                    interval: 1,
                                    endThumbIcon: SvgPicture.asset(
                                      ImageUtils.circle,
                                      height: 6.w,
                                    ),
                                    startThumbIcon: SvgPicture.asset(
                                      ImageUtils.circle,
                                      height: 6.w,
                                    ),
                                    activeColor: Color(0xff012239),
                                    child: SizedBox(
                                      width: Get.width,
                                    ),
                                    onChanged: (SfRangeValues rang) {
                                      setState(() {
                                        priceValue = rang;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Text(
                                    'Custom price range',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ColorUtils.black,
                                        fontWeight: FontWeightClass.medium),
                                  ),
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF6F8FA),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                              child: Text(
                                            'Low range',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight:
                                                    FontWeightClass.bold,
                                                color: ColorUtils.lightBlack
                                                    .withOpacity(0.25)),
                                          )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF6F8FA),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                              child: Text(
                                            'High range',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight:
                                                    FontWeightClass.bold,
                                                color: ColorUtils.lightBlack
                                                    .withOpacity(0.25)),
                                          )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 5.w,
                          ),
                          Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(color: ColorUtils.white),
                            child: TableCalendar(
                              focusedDay: DateTime.now(),
                              firstDay: DateTime.utc(2010, 10, 20),
                              lastDay: DateTime.utc(2025, 10, 10),
                              // rangeSelectionMode: RangeSelectionMode.toggledOn,
                            ),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 3.w,
                            ),
                            child: Center(
                              child: Container(
                                height: 12.w,
                                // width: 50.w,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: ls.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedIndex = index;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1.5.w),
                                          padding: EdgeInsets.all(2.w),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: _selectedIndex == index
                                                      ? Colors.transparent
                                                      : ColorUtils.darkBlack),
                                              borderRadius:
                                                  BorderRadius.circular(1.w),
                                              color: _selectedIndex == index
                                                  ? ColorUtils.darkBlack
                                                  : Colors.transparent),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 2.2.w),
                                                  child: Text(ls[index],
                                                      style: (_selectedIndex ==
                                                              index
                                                          ? FontTextStyle
                                                                  .GorditaW7S12darkBlack
                                                              .copyWith(
                                                                  color: ColorUtils
                                                                      .primaryColor)
                                                          : FontTextStyle
                                                                  .GorditaW5S10lightBlack
                                                              .copyWith(
                                                                  color: ColorUtils
                                                                      .black))),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
