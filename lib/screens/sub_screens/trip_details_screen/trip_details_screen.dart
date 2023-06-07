import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:traveler/router/route_constant.dart';
import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/paths.dart';
import 'package:traveler/widgets/common.dart';
import 'package:traveler/widgets/custom_images.dart';
import 'package:traveler/widgets/main_btn.dart';
import 'package:traveler/widgets/sub_btn.dart';

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  bool isContainerVisible = false;
  void _toggleContainerVisibility() {
    setState(() {
      isContainerVisible = !isContainerVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var common = Provider.of<Common>(context, listen: false);
    var size = MediaQuery.of(context).size;
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final pinFieldSize = isPortrait ? 70.0 : 50.0;
    final containerSize = isPortrait ? 70.0 : 50.0;
    double h;
    if (MediaQuery.of(context).size.height < 800) {
      h = MediaQuery.of(context).size.height - 88;
    } else {
      h = MediaQuery.of(context).size.height - 188;
    }
    return GestureDetector(
      onTap: () {
        if (isContainerVisible) {
          _toggleContainerVisibility(); // Close the container visibility
        }
      },
      child: Scaffold(body: OrientationBuilder(builder: (context, orientation) {
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
                //  const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 38,
                      ),
                      Container(
                        width: size.width,
                        height: isPortrait
                            ? 150
                            : MediaQuery.of(context).size.width / 3,
                        child: Stack(
                            alignment: AlignmentDirectional.center,
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Image.asset(
                                  Paths.imageAssets("map.png"),
                                  width: size.width,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                top: isPortrait ? 30 : 40,
                                left: 5,
                                right: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        Paths.imageAssets("planelinebox.png"),
                                        width: size.width,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("EG",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Text("UAE",
                                              style: TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Cairo",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Text("Dubai",
                                              style: TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: isPortrait ? 91 : 150,
                                left: isPortrait ? 50 : 60,
                                right: isPortrait ? 50 : 60,
                                child: Container(
                                  width: size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "May 12, 2023",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13),
                                      ),
                                      Text(
                                        "May 12, 2023",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                child: Container(
                                  width: size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back,
                                          color: ConstantColors.whiteColor,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          _toggleContainerVisibility();
                                        },
                                        icon: const Icon(
                                          Icons.more_vert,
                                          color: ConstantColors.whiteColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 35,
                                right: 20,
                                child: Visibility(
                                  visible: isContainerVisible,
                                  child: Container(
                                    width: 140,
                                    height: 90,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(255, 77, 75, 75)
                                              .withOpacity(
                                                  0.4), //color of shadow
                                          spreadRadius: 1, //spread radius
                                          blurRadius: 4, // blur radius
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: ConstantColors
                                                      .mainlyTextColor,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "Report Order",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: ConstantColors
                                                          .mainlyTextColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.error_outline,
                                                color: ConstantColors
                                                    .mainlyTextColor,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                "Report User",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: ConstantColors
                                                        .mainlyTextColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: isPortrait ? h : 706,
                  decoration: const BoxDecoration(
                    color: ConstantColors.whiteColor,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              Paths.imageAssets("profile5.jpg"),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Emma Samir",
                                              style: TextStyle(
                                                  color: ConstantColors
                                                      .mainlyTextColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 12,
                                                  width: 12,
                                                  child: Image.asset(
                                                    Paths.imageAssets(
                                                        "star.png"),
                                                  ),
                                                ),
                                                Container(
                                                  height: 12,
                                                  width: 12,
                                                  child: Image.asset(
                                                    Paths.imageAssets(
                                                        "star.png"),
                                                  ),
                                                ),
                                                Container(
                                                  height: 12,
                                                  width: 12,
                                                  child: Image.asset(
                                                    Paths.imageAssets(
                                                        "star.png"),
                                                  ),
                                                ),
                                                Container(
                                                  height: 12,
                                                  width: 12,
                                                  child: Image.asset(
                                                    Paths.imageAssets(
                                                        "star.png"),
                                                  ),
                                                ),
                                                Container(
                                                  height: 12,
                                                  width: 12,
                                                  child: Image.asset(
                                                    Paths.imageAssets(
                                                        "star.png"),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              MySeparator(color: Colors.grey),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Available weight",
                                    style: TextStyle(
                                        color: ConstantColors.darkGreyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Deal Method",
                                    style: TextStyle(
                                        color: ConstantColors.darkGreyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "17",
                                    style: TextStyle(
                                        color: ConstantColors.mainlyTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Shopper Buy",
                                    style: TextStyle(
                                        color: ConstantColors.mainlyTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              MySeparator(color: Colors.grey),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery Date From",
                                    style: TextStyle(
                                        color: ConstantColors.darkGreyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Delivery Date To",
                                    style: TextStyle(
                                        color: ConstantColors.darkGreyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "May 12,2023",
                                    style: TextStyle(
                                        color: ConstantColors.mainlyTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "May 20,2023",
                                    style: TextStyle(
                                        color: ConstantColors.mainlyTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              MySeparator(color: Colors.grey),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Pick up place",
                                style: TextStyle(
                                    color: ConstantColors.darkGreyColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(36),
                                        color: ConstantColors.tripContainer,
                                      ),
                                      width: size.width / 4,
                                      child: Text(
                                        "Homs",
                                        style: TextStyle(fontSize: 14),
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(36),
                                        color: ConstantColors.tripContainer,
                                      ),
                                      width: size.width / 4,
                                      child: Text(
                                        "Damascus",
                                        style: TextStyle(fontSize: 14),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MySeparator(color: Colors.grey),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Categories Not Acceptable",
                                style: TextStyle(
                                    color: ConstantColors.darkGreyColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(36),
                                        color: ConstantColors.tripContainer,
                                      ),
                                      width: 202,
                                      child: Text(
                                        "Cell phones & Accessories",
                                        style: TextStyle(fontSize: 14),
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(36),
                                        color: ConstantColors.tripContainer,
                                      ),
                                      width: size.width / 4,
                                      child: Text(
                                        "Food",
                                        style: TextStyle(fontSize: 14),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MySeparator(color: Colors.grey),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Traveler Note",
                                style: TextStyle(
                                    color: ConstantColors.darkGreyColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "if there are anything the traveler write here",
                                style: TextStyle(
                                    color: ConstantColors.mainlyTextColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
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
                            onTap: () {},
                            text: "Send Request",
                            borderRadius: BorderRadius.circular(10),
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
      })),
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
