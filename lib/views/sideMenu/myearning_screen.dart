import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/utils/variable_utils.dart';

import '../../utils/color_utils.dart';
import '../../utils/font_style_utils.dart';
import '../../utils/image_utils.dart';
import '../Message/Widgets/custome_appbar.dart';
import '../home/widgets/home_appbar_custom.dart';

class MyEarningScreen extends StatefulWidget {
  final List<Color> availableColors = const [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];
  const MyEarningScreen({Key? key}) : super(key: key);

  @override
  State<MyEarningScreen> createState() => _MyEarningScreenState();
}

class _MyEarningScreenState extends State<MyEarningScreen> {
  final Color barBackgroundColor = ColorUtils.white;
  final Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex = -1;

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      child: SafeArea(
        child: Scaffold(
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
                          Navigator.pop(context);
                        },
                        titleName: 'My Earnings',
                      )
                    ],
                  ),
                ),
              )),
          backgroundColor: ColorUtils.aliceBlue,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 40.w,
                  decoration: BoxDecoration(color: ColorUtils.navyBlue),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(VariableUtils.earning,
                          style: FontTextStyle.GorditaW5S14darkBlack.copyWith(
                              color: ColorUtils.primaryColor,
                              fontWeight: FontWeightClass.bold)),
                      Text(VariableUtils.totalearning,
                          style: FontTextStyle.GorditaW7S10darkBlack.copyWith(
                            color: ColorUtils.white,
                          )),
                    ],
                  ),
                ),

                // SizedBox(
                //   height: 10.w,
                // ),
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.w),
                      color: ColorUtils.primaryLight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 3.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  VariableUtils.totaltriprange,
                                  style: FontTextStyle.GorditaW7S12darkBlack,
                                ),
                                Text(
                                  VariableUtils.totaltrip,
                                  style: FontTextStyle.GorditaW5S10lightBlack,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                              child: VerticalDivider(
                                // color: Colors.red,
                                thickness: 2,
                                indent: 1,
                                endIndent: 0,
                                width: 2.w,
                              ),
                            ),
                            Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  VariableUtils.timeoutlinerange,
                                  style: FontTextStyle.GorditaW7S12darkBlack,
                                ),
                                Text(
                                  VariableUtils.timeoutline,
                                  style: FontTextStyle.GorditaW5S10lightBlack,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                              child: VerticalDivider(
                                // color: Colors.red,
                                thickness: 2,
                                indent: 1,
                                endIndent: 0,
                                width: 2.w,
                              ),
                            ),
                            Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  VariableUtils.totaldistancekm,
                                  style: FontTextStyle.GorditaW7S12darkBlack,
                                ),
                                Text(
                                  VariableUtils.totaldistance,
                                  style: FontTextStyle.GorditaW5S10lightBlack,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 17.w,
                      top: -10.w,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: ColorUtils.accent,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Text(VariableUtils.unpaidamounth,
                                    style: FontTextStyle.GorditaW7S10darkBlack
                                        .copyWith(
                                      color: ColorUtils.white,
                                    )),
                                Text(VariableUtils.unpaid,
                                    style: FontTextStyle.GorditaW7S10darkBlack
                                        .copyWith(
                                      color: ColorUtils.white,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: ColorUtils.accent,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Text(VariableUtils.Commissionpaidamounth,
                                    style: FontTextStyle.GorditaW7S10darkBlack
                                        .copyWith(
                                      color: ColorUtils.white,
                                    )),
                                Text(VariableUtils.commisionpaid,
                                    style: FontTextStyle.GorditaW7S10darkBlack
                                        .copyWith(
                                      color: ColorUtils.white,
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Column(
                        children: [
                          Text(
                            VariableUtils.earning,
                            style: FontTextStyle.GorditaW7S12darkBlack,
                          ),
                          Text(
                            '7 - 14 Dec 2021',
                            style: FontTextStyle.GorditaW5S10lightBlack,
                          )
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.w,
                ),
                AspectRatio(
                  aspectRatio: 1,
                  child: Card(
                    color: ColorUtils.aliceBlue,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              const SizedBox(),
                              const SizedBox(),
                              const SizedBox(),
                              const SizedBox(
                                height: 38,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: BarChart(
                                    isPlaying ? randomData() : mainBarData(),
                                    swapAnimationDuration: animDuration,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                color: const Color(0xff0f4a3c),
                              ),
                              onPressed: () {
                                setState(() {
                                  isPlaying = !isPlaying;
                                  if (isPlaying) {
                                    refreshState();
                                  }
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                  child: Text(
                    VariableUtils.transaction,
                    style: FontTextStyle.GorditaW5S14darkBlack.copyWith(
                        fontWeight: FontWeightClass.bold),
                  ),
                ),
                Container(
                  height: 60.w,
                  // color: Colors.red,
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: ColorUtils.aliceBlue,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5.w,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      //child: Text('PP'),
                                      backgroundImage:
                                          AssetImage(ImageUtils.driverprofile),
                                      radius: 20,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              VariableUtils.earning,
                                              style: FontTextStyle
                                                      .GorditaW7S10darkBlack
                                                  .copyWith(
                                                      color: ColorUtils.accent,
                                                      fontSize: 9.sp),
                                            ),
                                            Text(
                                              VariableUtils.pickupcar,
                                              style: FontTextStyle
                                                      .GorditaW7S10darkBlack
                                                  .copyWith(fontSize: 9.sp),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          VariableUtils.complatedate,
                                          style: FontTextStyle
                                              .GorditaW5S10lightBlack,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.black,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? Colors.black : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: Colors.black, width: 1)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 3, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 20, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 10, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 20, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.lightGreenAccent,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = '8 Dec';
                  break;
                case 1:
                  weekDay = '8 Dec';
                  break;
                case 2:
                  weekDay = '8 Dec';
                  break;
                case 3:
                  weekDay = '8 Dec';
                  break;
                case 4:
                  weekDay = '8 Dec';
                  break;
                case 5:
                  weekDay = '8 Dec';
                  break;
                case 6:
                  weekDay = '8 Dec';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                weekDay + '\n',
                const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.toY - 1).toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('M', style: style);
        break;
      case 1:
        text = const Text('T', style: style);
        break;
      case 2:
        text = const Text('W', style: style);
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 4:
        text = const Text('F', style: style);
        break;
      case 5:
        text = const Text('S', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return Padding(padding: const EdgeInsets.only(top: 16), child: text);
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, Random().nextInt(15).toDouble() + 6,
                barColor: Colors.black);
          case 1:
            return makeGroupData(1, Random().nextInt(15).toDouble() + 6,
                barColor: Colors.black);
          case 2:
            return makeGroupData(2, Random().nextInt(15).toDouble() + 6,
                barColor: Colors.black);
          case 3:
            return makeGroupData(3, Random().nextInt(15).toDouble() + 6,
                barColor: Colors.black);
          case 4:
            return makeGroupData(4, Random().nextInt(15).toDouble() + 6,
                barColor: Colors.black);
          case 5:
            return makeGroupData(5, Random().nextInt(15).toDouble() + 6,
                barColor: Colors.black);
          case 6:
            return makeGroupData(6, Random().nextInt(15).toDouble() + 6,
                barColor: Colors.black);
          default:
            return throw Error();
        }
      }),
      gridData: FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
        animDuration + const Duration(milliseconds: 50));
    if (isPlaying) {
      await refreshState();
    }
  }
}
