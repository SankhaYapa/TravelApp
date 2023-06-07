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

class OrderReviewScreen extends StatefulWidget {
  const OrderReviewScreen({Key? key}) : super(key: key);

  @override
  State<OrderReviewScreen> createState() => _OrderReviewScreenState();
}

bool isChecked = false;

class _OrderReviewScreenState extends State<OrderReviewScreen> {
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
                CustomHederWidget(
                  title: "Order Review",
                  ontap: () {
                    _showBottomDrawer(context);
                  },
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
                            text: "Submit",
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

  void _showBottomDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;
        double heading = size.width * 0.03;
        double starIcon = size.width * 0.03;
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: Container(
              height: 711,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 23, left: 10, right: 10),
                      child: Column(
                        children: [
                          Text(
                            "You may find some or all of these items depending on the 'Deal Method' you choose.",
                            style: TextStyle(
                                fontSize: heading, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Product Price: ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: heading,
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text:
                                        'This amount is added based on the price of the product you request and is present when using the \'Traveler Buy\' Deal Method.',
                                    style: TextStyle(
                                        color: ConstantColors.darkGreyColor,
                                        fontSize: heading,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Traveler Reward: ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: heading,
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text:
                                        "This is the amount you will pay to the traveler as a reward for bringing the product to you.",
                                    style: TextStyle(
                                        color: ConstantColors.darkGreyColor,
                                        fontSize: heading,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Payment Processor: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: heading,
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text:
                                        "If you use the 'Traveler Buy' Deal Method, expect to see this item, which is a 5% fee paid to the company that processes the payment to the traveler.",
                                    style: TextStyle(
                                        color: ConstantColors.darkGreyColor,
                                        fontSize: heading,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: "App fee: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: heading,
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text:
                                        "This amount helps us streamline the app's operation and continue to provide the service.",
                                    style: TextStyle(
                                        color: ConstantColors.darkGreyColor,
                                        fontSize: heading,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Total Amount: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: heading,
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text:
                                        "This is the total amount that will be deducted from your account when the payment is executed.",
                                    style: TextStyle(
                                        color: ConstantColors.darkGreyColor,
                                        fontSize: heading,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
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
                          left: 20, right: 20, bottom: 29, top: 29),
                      child: SubBtn(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        text: "Close",
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
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
