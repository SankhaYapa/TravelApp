import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:traveler/screens/sub_screens/tracking_shopper_screen/tracking_shopper_screen.dart';
import 'package:traveler/values/constant_colors.dart';

import '../../../../values/paths.dart';
import '../../../../values/util_function.dart';
import '../../../sub_screens/order_details_screen/order_details.dart';

class MyOrdersInTransist extends StatefulWidget {
  const MyOrdersInTransist({Key? key}) : super(key: key);

  @override
  State<MyOrdersInTransist> createState() => _MyOrdersInTransistState();
}

class _MyOrdersInTransistState extends State<MyOrdersInTransist> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double Myfont = size.width * 0.03;
    double starIcon = size.width * 0.03;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          CustomOrderWidget(
            size: size,
            name: "ASUS Laptop",
            mainImg: "product4.jpg",
            prfleImg: "profile3.png",
            ontap: () {
              UtilFunction.navigateTo(context, const OrderDetailsScreen());
            },
          ),
          const SizedBox(
            height: 94,
          ),
        ],
      )),
    );
  }
}

class CustomOrderWidget extends StatefulWidget {
  const CustomOrderWidget(
      {Key? key,
      required this.size,
      required this.name,
      required this.mainImg,
      required this.prfleImg,
      required this.ontap})
      : super(key: key);

  final Size size;
  final String name;
  final String mainImg;
  final String prfleImg;
  final Function() ontap;

  @override
  State<CustomOrderWidget> createState() => _CustomOrderWidgetState();
}

class _CustomOrderWidgetState extends State<CustomOrderWidget> {
  bool isContainerVisible = false;

  void _toggleContainerVisibility() {
    setState(() {
      isContainerVisible = !isContainerVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double Myfont = size.width * 0.035;
    double MyfontHeading = size.width * 0.04;

    double optionsicon = size.width * 0.04;

    double starIcon = size.width * 0.04;

    return Stack(
      children: [
        GestureDetector(
          onTap: widget.ontap,
          child: AspectRatio(
            aspectRatio: 29 / 14,
            child: Container(
              height: 150,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 77, 75, 75)
                        .withOpacity(0.2), //color of shadow
                    spreadRadius: 2, //spread radius
                    blurRadius: 5, // blur radius
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Damascus",
                          style: TextStyle(
                              fontSize: MyfontHeading,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/images/product1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 200,
                    child: Container(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RotatedBox(
                                    quarterTurns: 1,
                                    child: Icon(
                                      Icons.airplanemode_active,
                                      size: starIcon + 10,
                                      color: Color(0xFFBE1279),
                                    )),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Cairo',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: MyfontHeading,
                                          color: Color(0xFF313131),
                                        ),
                                      ),
                                      SizedBox(
                                        width: optionsicon,
                                      ),
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _toggleContainerVisibility();
                                            },
                                            child: Image.asset(
                                              Paths.iconAssets("options.png"),
                                              width: optionsicon,
                                              height: optionsicon,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'HOME IT Mop And Broom Holder',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: Myfont,
                                          color: Color(0xFF313131),
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month,
                                            color: ConstantColors.darkGreyColor,
                                            size: starIcon + 2,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            'Before',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: Myfont,
                                              color:
                                                  ConstantColors.darkGreyColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'May 12, 2023',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: Myfont,
                                              color: Color(0xFF313131),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              'Price',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: Myfont,
                                                color: Color(0xFF5A5D5A),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '\$1200',
                                            style: TextStyle(
                                              color: Color(0xFFBE1279),
                                              fontWeight: FontWeight.w500,
                                              fontSize: Myfont,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              'Reward',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: Myfont,
                                                color: Color(0xFF5A5D5A),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '\$1200',
                                            style: TextStyle(
                                              color: Color(0xFFBE1279),
                                              fontWeight: FontWeight.w500,
                                              fontSize: Myfont,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              'Deal Method',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: Myfont,
                                                color: Color(0xFF5A5D5A),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              'By Shopper',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: Myfont,
                                                color: Colors.black,
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
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              'Your order now in transit.',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: Myfont,
                                                color: ConstantColors.mainColor,
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 35,
          top: 20,
          child: Visibility(
            visible: isContainerVisible,
            child: Container(
              height: 60,
              width: 140,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color(0xFFCCCCCC),
                  )),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      UtilFunction.navigateTo(context, TrackingShopperScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(Paths.iconAssets("tracking.png"),
                            width: 13, height: 12.8),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Tracking Order",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      UtilFunction.navigateTo(context, OrderDetailsScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(Paths.iconAssets("view.png"),
                            width: 13, height: 13),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "View Order",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
