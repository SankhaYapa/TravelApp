import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/paths.dart';
import 'package:traveler/widgets/gradient_text.dart';

class ChooseTripScreen extends StatefulWidget {
  const ChooseTripScreen({Key? key}) : super(key: key);

  @override
  State<ChooseTripScreen> createState() => _ChooseTripScreenState();
}

class _ChooseTripScreenState extends State<ChooseTripScreen> {
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
              "Choose a Trip",
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
              child: Column(
                children: [
                  Column(
                    children: [
                      CustomeChooseTripScreenWidget(size: size),
                      SizedBox(
                        height: 10,
                      ),
                      CustomeChooseTripScreenWidget(size: size),
                      SizedBox(
                        height: 10,
                      ),
                      CustomeChooseTripScreenWidget(size: size),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomeChooseTripScreenWidget extends StatelessWidget {
  const CustomeChooseTripScreenWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 77, 75, 75)
                  .withOpacity(0.2), //color of shadow
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
              height: 165,
              width: size.width - 1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ConstantColors.green,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Positioned(
              top: 4,
              left: 0,
              right: 0,
              child: Container(
                height: 165,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                  width: size.width - 40,
                                  child: MySeparator(color: Colors.grey)),
                              Positioned(
                                right: 0,
                                top: -8,
                                child: Container(
                                    child: Stack(children: [
                                  Image.asset(
                                    Paths.imageAssets("lable.png"),
                                    width: 50,
                                    height: 16,
                                  ),
                                  Positioned(
                                    top: 2,
                                    left: 12,
                                    child: Text(
                                      "Active",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ])),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 8, right: 8),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomeRectangle(
                                text1: "9",
                                text2: "Request",
                              ),
                              CustomeRectangle(
                                text1: "9",
                                text2: "Deals",
                              ),
                              CustomeRectangle(
                                text1: "\$9",
                                text2: "Earning",
                              ),
                              CustomeRectangle(
                                text1: "1 KG",
                                text2: "Reserved",
                              ),
                              CustomeRectangle(
                                text1: "17 KG",
                                text2: "Available",
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomeRectangle extends StatelessWidget {
  const CustomeRectangle({
    required this.text1,
    required this.text2,
    Key? key,
  }) : super(key: key);
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55, //MediaQuery.of(context).size.width / 7,
      height: 40,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 111, 111, 111)
                .withOpacity(0.2), //color of shadow
            spreadRadius: 2, //spread radius
            blurRadius: 5, // blur radius
            offset: Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(bottom: 3, top: 5, left: 5, right: 5),
      child: Column(children: [
        GradientText(
          text: text1,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
        SizedBox(
          height: 4,
        ),
        Text(
          text2,
          style: TextStyle(fontSize: 10),
        )
      ]),
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
