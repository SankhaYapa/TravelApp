import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:traveler/screens/sub_screens/trip_details_screen/trip_details_screen.dart';
import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/paths.dart';
import 'package:traveler/widgets/gradient_text.dart';

import '../../../values/util_function.dart';

class MatchingTripsScreen extends StatefulWidget {
  const MatchingTripsScreen({Key? key}) : super(key: key);

  @override
  State<MatchingTripsScreen> createState() => _MatchingTripsScreenState();
}

class _MatchingTripsScreenState extends State<MatchingTripsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              decoration: BoxDecoration(
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
            )),
            pinned: true,
            title: const Text(
              "Matching Trips",
              style: TextStyle(
                fontSize: 18,
                color: ConstantColors.whiteColor,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ConstantColors.whiteColor,
              ),
            ),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: FadeInUp(
                child: Column(
                  children: [
                    Column(
                      children: [
                        CustomeTripWidget(
                          size: size,
                          ontap: () {
                            UtilFunction.navigateTo(
                                context, TripDetailsScreen());
                          },
                          name: "Emmar Smith",
                          prfleImg: "profile5.jpg",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomeTripWidget(
                          size: size,
                          ontap: () {
                            UtilFunction.navigateTo(
                                context, TripDetailsScreen());
                          },
                          name: "Emmar Smith",
                          prfleImg: "profile5.jpg",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomeTripWidget(
                          size: size,
                          ontap: () {
                            UtilFunction.navigateTo(
                                context, TripDetailsScreen());
                          },
                          name: "Emmar Smith",
                          prfleImg: "profile5.jpg",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomeTripWidget(
                          size: size,
                          ontap: () {
                            UtilFunction.navigateTo(
                                context, TripDetailsScreen());
                          },
                          name: "Emmar Smith",
                          prfleImg: "profile5.jpg",
                        ),
                        SizedBox(
                          height: 94,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomeTripWidget extends StatelessWidget {
  const CustomeTripWidget(
      {Key? key,
      required this.size,
      required this.name,
      required this.prfleImg,
      required this.ontap})
      : super(key: key);

  final Size size;
  final String name;
  final String prfleImg;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(top: 6, left: 10, right: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 77, 75, 75)
                    .withOpacity(0.3), //color of shadow
                spreadRadius: 2, //spread radius
                blurRadius: 5, // blur radius
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 150,
                width: size.width - 1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF8922B8),
                      Color(0xFFBC167A),
                      Color(0xFFBE1279),
                    ],
                    stops: [
                      0.0067,
                      0.3146,
                      0.9859,
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 4,
                left: 0,
                right: 0,
                child: Container(
                  height: 150,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "SY",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color.fromRGBO(90, 93, 90, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "Damascus",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color.fromRGBO(49, 49, 49, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "May 17, 2023 ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color.fromRGBO(90, 93, 90, 1),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: 128,
                                      height: 32,
                                      child: Image.asset(Paths.imageAssets(
                                          "eroplanewithline.png"))),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "Deal Method",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color.fromRGBO(90, 93, 90, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "Shopper Buy",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color.fromRGBO(49, 49, 49, 1),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "SY",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color.fromRGBO(90, 93, 90, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "Damascus",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color.fromRGBO(49, 49, 49, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "May 17, 2023",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color.fromRGBO(90, 93, 90, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          MySeparator(color: Colors.grey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                            Paths.imageAssets(prfleImg)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          name,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(90, 93, 90, 1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 12,
                                              width: 12,
                                              child: Image.asset(
                                                Paths.imageAssets("star.png"),
                                              ),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 12,
                                              child: Image.asset(
                                                Paths.imageAssets("star.png"),
                                              ),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 12,
                                              child: Image.asset(
                                                Paths.imageAssets("star.png"),
                                              ),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 12,
                                              child: Image.asset(
                                                Paths.imageAssets("star.png"),
                                              ),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 12,
                                              child: Image.asset(
                                                Paths.imageAssets("star.png"),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                  mouseCursor:
                                      MaterialStateMouseCursor.clickable,
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Color.fromARGB(255, 77, 75, 75)
                                                    .withOpacity(
                                                        0.4), //color of shadow
                                            spreadRadius: 1, //spread radius
                                            blurRadius: 4, // blur radius
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF8922B8),
                                            Color(0xFFBC167A),
                                            Color(0xFFBE1279),
                                          ],
                                          stops: [
                                            0.0067,
                                            0.3146,
                                            0.9859,
                                          ],
                                        ),
                                      ),
                                      height: 24,
                                      width: 100,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 7,
                                            right: 7,
                                            top: 5,
                                            bottom: 4),
                                        child: Text(
                                          "Send Request",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                        ),
                                      )))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
