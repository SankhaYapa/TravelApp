import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:traveler/screens/dashboad_screen/home_screen/tab_screens/home_trips.dart';
import 'package:traveler/screens/sub_screens/outgoing_order_requests/outgoing_order_main.dart';
import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/paths.dart';
import 'package:traveler/values/util_function.dart';
import 'package:traveler/widgets/common.dart';
import 'package:traveler/widgets/custom_header.dart';
import 'package:traveler/widgets/gradient_text.dart';
import 'package:traveler/widgets/main_btn.dart';
import 'package:traveler/widgets/sub_btn.dart';

import '../../../router/route_constant.dart';

class PrePaymentScreen extends StatefulWidget {
  const PrePaymentScreen({Key? key}) : super(key: key);

  @override
  State<PrePaymentScreen> createState() => _PrePaymentScreenState();
}

bool isChecked = false;

class _PrePaymentScreenState extends State<PrePaymentScreen> {
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

  bool status1 = false;
  final TextEditingController controller = TextEditingController();
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var common = Provider.of<Common>(context, listen: false);
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final pinFieldSize = isPortrait ? 70.0 : 50.0;
    final containerSize = isPortrait ? 70.0 : 50.0;
    return Scaffold(
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
                CustomHederWidget(title: "Pre-payment review"),
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
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Color(0xFFCCCCCC),
                                    )),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Product Price",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: ConstantColors
                                                  .mainlyTextColor),
                                        ),
                                        Text(
                                          "\$109.25",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: ConstantColors
                                                  .mainlyTextColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    MySeparator(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Tax or Shipping",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: ConstantColors
                                                  .mainlyTextColor),
                                        ),
                                        Text(
                                          "\$10",
                                          style: TextStyle(
                                              color: ConstantColors
                                                  .mainlyTextColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    MySeparator(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Traveler Reward",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: ConstantColors
                                                  .mainlyTextColor),
                                        ),
                                        Text(
                                          "\$7",
                                          style: TextStyle(
                                              color: ConstantColors
                                                  .mainlyTextColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    MySeparator(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Payment Processor",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: ConstantColors
                                                  .mainlyTextColor),
                                        ),
                                        Text(
                                          "\$6",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: ConstantColors
                                                  .mainlyTextColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    MySeparator(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "App Fee",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: ConstantColors
                                                  .mainlyTextColor),
                                        ),
                                        Text(
                                          "\$3",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: ConstantColors
                                                  .mainlyTextColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 21,
                                    ),
                                    TextField(
                                      controller: controller,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            left: 20, right: 30),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                            color: Color(
                                                0xFFCCCCCC), // Customize the color of the border
                                            width:
                                                1, // Customize the width of the border
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                            color: ConstantColors
                                                .mainColor, // Customize the color of the border when focused
                                            width: 1,
                                          ),
                                        ),
                                        hintText: 'Enter voucher code',
                                        hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: ConstantColors.greyColor,
                                            fontWeight: FontWeight.w400),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            'assets/icons/voucher.png',
                                            height: 2,
                                          ),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 20,
                                            padding: EdgeInsets.only(right: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Submit",
                                                  style: TextStyle(
                                                    color: isFocused
                                                        ? Colors.grey
                                                        : ConstantColors
                                                            .mainColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Use your wallet balance \$15",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        FlutterSwitch(
                                          activeColor: ConstantColors.mainColor,
                                          inactiveColor:
                                              ConstantColors.greyColor,
                                          width: 36,
                                          height: 20,
                                          toggleSize: 13,
                                          value: status1,
                                          onToggle: (val) {
                                            setState(() {
                                              status1 = val;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GradientText(
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                          text: "Total Amount",
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              ConstantColors.mainColor,
                                              ConstantColors.mainColor2,
                                              ConstantColors.mainColor3,
                                            ],
                                          ),
                                        ),
                                        GradientText(
                                          text: "\$130.25",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              ConstantColors.mainColor,
                                              ConstantColors.mainColor2,
                                              ConstantColors.mainColor3,
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/icons/message.png',
                                    width: 27,
                                    height: 28,
                                  ),
                                  Container(
                                    width: size.width * 0.85,
                                    child: Text(
                                      "Upon completing your payment, you will have access to a chat with the traveler, where you can communicate and provide any additional details about your request. This feature is designed to enhance your shopping experience, ensure timely delivery, and increase trust between you and the traveler.",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: ConstantColors.darkGreyColor),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/icons/location.png',
                                    width: 27,
                                    height: 28,
                                  ),
                                  Container(
                                    width: size.width * 0.85,
                                    child: Text(
                                      "After completing your payment, you will have access to order tracking, which allows you to check the status of your order until you receive your product. This feature helps you stay informed about the progress of your order and know when to expect its delivery.",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: ConstantColors.darkGreyColor),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
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
                            onTap: () {
                              UtilFunction.navigateTo(
                                  context, OutGoingOrderScreen());
                            },
                            text: "Pay",
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.grey})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 3.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
