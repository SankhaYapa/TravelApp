import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/enums/tooltip_direction_enum.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/hatch_mark.dart';
import 'package:another_xlider/models/range_step.dart';
import 'package:another_xlider/models/slider_step.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/tooltip/tooltip_box.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:traveler/screens/sub_screens/send_offer_screen/custome_slider.dart';
import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/paths.dart';
import 'package:traveler/widgets/common.dart';
import 'package:traveler/widgets/custom_header.dart';
import 'package:traveler/widgets/main_btn.dart';
import 'package:traveler/widgets/sub_btn.dart';

class SendOfferScreen extends StatefulWidget {
  const SendOfferScreen({Key? key}) : super(key: key);

  @override
  State<SendOfferScreen> createState() => _SendOfferScreenState();
}

bool isChecked = false;

class _SendOfferScreenState extends State<SendOfferScreen> {
  RangeValues _selectedRange = RangeValues(0, 50);
  TextEditingController _textEditingController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_updateRangeValues);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _updateRangeValues() {
    final text = _textEditingController.text;
    final values = text.split(' - ');
    if (values.length == 2) {
      final start = double.tryParse(values[0]) ?? _selectedRange.start;
      final end = double.tryParse(values[1]) ?? _selectedRange.end;
      setState(() {
        _selectedRange = RangeValues(start, end);
      });
    }
  }

  double _lowerValue = 10;
  double _upperValue = 0;
  bool shouldCheck = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var common = Provider.of<Common>(context, listen: false);
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final pinFieldSize = isPortrait ? 70.0 : 50.0;
    final containerSize = isPortrait ? 70.0 : 50.0;
    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                ConstantColors.mainColor,
                ConstantColors.mainColor2,
                ConstantColors.mainColor3,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomHederWidget(
                  title: "Send Offer",
                  iconsuffix: Icon(null),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: isPortrait
                      ? MediaQuery.of(context).size.height - 94
                      : 706,
                  decoration: const BoxDecoration(
                    color: ConstantColors.whiteColor,
                    // borderRadius: BorderRadius.only(
                    //   topRight: Radius.circular(20),
                    //   topLeft: Radius.circular(20),
                    // ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Your Reward",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          TextField(

                                              // controller: _textEditingController,
                                              // readOnly: true,
                                              decoration: InputDecoration(
                                            focusColor:
                                                ConstantColors.mainColor,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: ConstantColors
                                                    .mainColor, // Customize the color of the border when focused
                                                width: 1,
                                              ),
                                            ),
                                            fillColor: Colors.white,
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 20, right: 30),
                                            prefixIcon: Icon(
                                              Icons.attach_money,
                                              color: ConstantColors.mainColor,
                                            ),
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          )),
                                          Positioned(
                                            top: 12,
                                            left: 5,
                                            right: 0,
                                            child: Container(
                                                width: size.width - 30,
                                                child: CustomRanger()),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      "Lower reward increases chances of winning Deals.",
                                      style: TextStyle(
                                          color: ConstantColors.darkGreyColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    CustomCheckBox(
                                      value: shouldCheck,
                                      shouldShowBorder: true,
                                      borderColor:
                                          ConstantColors.mainlyTextColor,
                                      checkedFillColor:
                                          Color.fromARGB(255, 255, 254, 253),
                                      checkedIconColor:
                                          ConstantColors.mainColor,
                                      borderRadius: 5,
                                      borderWidth: 2,
                                      checkBoxSize: 19,
                                      onChanged: (val) {
                                        //do your stuff here
                                        setState(() {
                                          shouldCheck = val;
                                        });
                                      },
                                    ),
                                    Text(
                                      "Add shipping and customs fees",
                                      style: TextStyle(
                                          color: ConstantColors.mainlyTextColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Amount",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                        decoration: InputDecoration(
                                      focusColor: ConstantColors.mainColor,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                          color: ConstantColors
                                              .mainColor, // Customize the color of the border when focused
                                          width: 1,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          left: 20, right: 30),
                                      prefixIcon: Icon(
                                        Icons.attach_money,
                                        color: ConstantColors.mainColor,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintStyle: const TextStyle(
                                        color: ConstantColors.hintTextColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    )),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      "Add any shipping or customs fees you may anticipate for the product here.",
                                      style: TextStyle(
                                          color: ConstantColors.darkGreyColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      "Message To The Shopper",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                        maxLines: 6,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: ConstantColors
                                                  .mainColor, // Customize the color of the border when focused
                                              width: 1,
                                            ),
                                          ),
                                          fillColor: Colors.white,
                                          contentPadding: const EdgeInsets.only(
                                              left: 20, right: 30, top: 20),
                                          filled: true,
                                          hintStyle: const TextStyle(
                                            color: ConstantColors.hintTextColor,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Color(0xFFE2E2E2),
                                      style: BorderStyle.solid,
                                      width: 1))),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 29, bottom: 29),
                            child: SubBtn(
                              onTap: () {},
                              text: "Send",
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Container CustomRanger() {
    Widget icon;

    if (_lowerValue >= 0 && _lowerValue <= 2) {
      icon = Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 10),
          height: 20,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 19, 2),
                Color.fromARGB(255, 225, 32, 6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Text(
            "Bad Chances",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          ));
    } else if (_lowerValue >= 2 && _lowerValue <= 7) {
      icon = Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 10),
          height: 20,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 250, 65, 13),
                Color.fromARGB(255, 255, 100, 3),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Text(
            "Low Chances",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          ));
      ;
    } else if (_lowerValue >= 7 && _lowerValue < 10) {
      icon = Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 10),
          height: 20,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 248, 236, 4),
                Color.fromARGB(255, 255, 217, 1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Text(
            "Good Chances",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          ));
      ;
    } else if (_lowerValue >= 10.0) {
      icon = Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 10),
          height: 20,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 72, 200, 40),
                Color.fromARGB(255, 62, 203, 64),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Text(
            "High Chances",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          ));
    } else {
      icon = Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 10),
          height: 20,
          width: 90,
          decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   colors: [
              //     Color.fromARGB(255, 72, 200, 40),
              //     Color.fromARGB(255, 62, 203, 64),
              //   ],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomLeft,
              // ),
              ),
          child: null);
    }

    return Container(
      height: 63,
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 0),
                    child: Text(
                      _lowerValue.toInt().toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  icon
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FlutterSlider(
                        // step: FlutterSliderStep(
                        //     step: 1, // default
                        //     isPercentRange:
                        //         true, // ranges are percents, 0% to 20% and so on... . default is true
                        //     rangeList: [
                        //       FlutterSliderRangeStep(from: 0, to: 20, step: 1),
                        //       FlutterSliderRangeStep(from: 20, to: 100, step: 2),
                        //     ]),

                        handlerWidth: 20,
                        rtl: true,

                        handlerHeight: 20,
                        values: [_lowerValue],
                        max: 10,
                        min: 0,
                        handler: FlutterSliderHandler(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 144, 7, 208),
                                  Color.fromARGB(255, 194, 45, 134),
                                  Color.fromARGB(255, 228, 73, 166),
                                ],
                                stops: [0.0, 0.3342, 0.8548],
                                transform: GradientRotation(2.39),
                              ),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 77, 75, 75)
                                      .withOpacity(0.2), //color of shadow
                                  spreadRadius: 2, //spread radius
                                  blurRadius: 5, // blur radius
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 10,
                            )),

                        trackBar: FlutterSliderTrackBar(
                            activeTrackBarHeight: 4,
                            inactiveDisabledTrackBarColor: Colors.red,
                            inactiveTrackBarHeight: 5,
                            inactiveTrackBar: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors
                                      .grey, // Adjust the color for the inactive track bar
                                  Colors
                                      .grey, // Adjust the color for the inactive track bar
                                ],
                                stops: [0.0, 1.0],
                              ),
                            ),
                            activeTrackBar: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 194, 45, 134),
                                  Color.fromARGB(255, 228, 73, 166),
                                  Color(0xFF8922B8),
                                ],
                                stops: [0.0, 0.3342, 0.8548],
                                transform: GradientRotation(2.39),
                              ),
                            )),
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          setState(() {
                            _lowerValue = lowerValue;
                          });
                        },
                        onDragCompleted:
                            (handlerIndex, lowerValue, upperValue) {
                          setState(() {
                            _lowerValue = lowerValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 2.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
