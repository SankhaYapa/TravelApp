import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:traveler/router/route_constant.dart';
import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/paths.dart';
import 'package:traveler/widgets/common.dart';
import 'package:traveler/widgets/custom_images.dart';
import 'package:traveler/widgets/gradient_text.dart';
import 'package:traveler/widgets/main_btn.dart';
import 'package:traveler/widgets/sub_btn.dart';

class TrackingShopperScreen extends StatefulWidget {
  const TrackingShopperScreen({Key? key}) : super(key: key);

  @override
  State<TrackingShopperScreen> createState() => _TrackingShopperScreenState();
}

void _showBottomDrawer(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          height: 711,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 37, right: 37, top: 23),
                  child: Container(
                    child: Column(
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     InkWell(
                        //         onTap: () {
                        //           Navigator.pop(context);
                        //         },
                        //         child: Icon(Icons.close)),
                        //   ],
                        // ),
                        SizedBox(
                          height: 130,
                        ),
                        Text(
                          "Please rate your experience on a scale of 1 to 5 stars. Your feedback is important to us and to our community.",
                          style: TextStyle(
                            color: ConstantColors.mainColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 73,
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star_border,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
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
                    text: "Submit",
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showBottomDrawerQr(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return SingleChildScrollView(
          child: Container(
            height: 711,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 37,
                      right: 37,
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     InkWell(
                          //         onTap: () {
                          //           Navigator.pop(context);
                          //         },
                          //         child: Icon(Icons.close)),
                          //   ],
                          // ),
                          SizedBox(
                            height: 130,
                          ),
                          Text(
                            "Sharing this QR code with the traveler confirms that you have received your order.",
                            style: TextStyle(
                              color: ConstantColors.mainColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 98,
                          ),
                          Container(
                              height: 175,
                              width: 175,
                              child: Image.asset(Paths.imageAssets("qr.jpg"))),
                        ],
                      ),
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
                      text: "Submit",
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

class _TrackingShopperScreenState extends State<TrackingShopperScreen> {
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
    return GestureDetector(
      onTap: () {
        if (isContainerVisible) {
          _toggleContainerVisibility(); // Close the container visibility
        }
      },
      child: Scaffold(
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
            child: LayoutBuilder(builder: (context, constraints) {
              if (MediaQuery.of(context).size.height < 800) {
                return SingleChildScrollView(
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
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
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
                                              Paths.imageAssets(
                                                  "planelinebox.png"),
                                              width: size.width,
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                color:
                                                    ConstantColors.whiteColor,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                _toggleContainerVisibility();
                                              },
                                              icon: const Icon(
                                                Icons.more_vert,
                                                color:
                                                    ConstantColors.whiteColor,
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
                                          height: 50,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(left: 5),
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                        255, 77, 75, 75)
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
                                                        "Report Deal",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: ConstantColors
                                                                .mainlyTextColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )
                                                    ],
                                                  ),
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
                        height: isPortrait
                            ? MediaQuery.of(context).size.height - 188
                            : 706,
                        decoration: BoxDecoration(
                          color: ConstantColors.whiteColor,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 6,
                                          bottom: 6),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Color.fromARGB(255, 77, 75, 75)
                                                    .withOpacity(
                                                        0.2), //color of shadow
                                            spreadRadius: 1, //spread radius
                                            blurRadius: 3, // blur radius
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                child: ClipOval(
                                                  child: Image.asset(
                                                    Paths.imageAssets(
                                                        "profile5.jpg"),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "Emma Samir",
                                                    style: TextStyle(
                                                        color: ConstantColors
                                                            .mainlyTextColor,
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        77,
                                                                        75,
                                                                        75)
                                                                .withOpacity(
                                                                    0.4), //color of shadow
                                                            spreadRadius:
                                                                1, //spread radius
                                                            blurRadius:
                                                                4, // blur radius
                                                            offset:
                                                                Offset(0, 3),
                                                          ),
                                                        ],
                                                        gradient:
                                                            LinearGradient(
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
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
                                                      width: 85,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 7,
                                                                right: 7,
                                                                top: 5,
                                                                bottom: 4),
                                                        child: Text(
                                                          "Chat",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 12),
                                                        ),
                                                      )))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Color.fromARGB(255, 77, 75, 75)
                                                    .withOpacity(
                                                        0.2), //color of shadow
                                            spreadRadius: 1, //spread radius
                                            blurRadius: 3, // blur radius
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "Traveler Reward",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text("\$90.11",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: ConstantColors
                                                              .mainColor)),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "Start Date",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text("May 3, 2023 19:29",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: ConstantColors
                                                              .mainColor)),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "Deal Method",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text("Shopper Buy",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: ConstantColors
                                                              .mainColor)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          MySeparator(color: Colors.grey),
                                          Container(
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 18,
                                                    ),
                                                    CircleIcon(),
                                                    VerticalLineSteps(),
                                                    CircleWrongIcon(),
                                                    VerticalLineSteps(),
                                                    CircleInactiveIcon(),
                                                    VerticalLineSteps(),
                                                    CircleIcon(),
                                                    SizedBox(
                                                      height: 18,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 18,
                                                    ),
                                                    Text(
                                                      "The shopper has made the payment.",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: ConstantColors
                                                              .darkGreyColor),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "The Traveler picked up the item.",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: ConstantColors
                                                              .darkGreyColor),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "The shopper confirmed the delivery.",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: ConstantColors
                                                              .darkGreyColor),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "Rate the traveler.",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: ConstantColors
                                                              .darkGreyColor),
                                                    ),
                                                    SizedBox(
                                                      height: 18,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          MySeparator(color: Colors.grey),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Product Price",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    "Tax or Shipping",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    "Traveler Reward",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text("Traveler Deals fee"),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    "Payment processor",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  GradientText(
                                                    text: "Total Amount",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
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
                                                  )
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "\$109.25",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    "\5",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    "\$18.20",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    "\$3.25",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    "\$6.50",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  GradientText(
                                                    text: "\$124.99",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
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
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          //  VerticalStepIndicator(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    top: BorderSide(
                                        color: Color(0xFFE2E2E2), width: 1)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 29, top: 29),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _showBottomDrawerQr(context);
                                      },
                                      child: Container(
                                        height: 44,
                                        width: 150,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              ConstantColors.mainColor,
                                              ConstantColors.mainColor2,
                                              ConstantColors.mainColor3,
                                            ],
                                          ),
                                        ),
                                        child: Text(
                                          "Show QR Code",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: ConstantColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _showBottomDrawer(context);
                                      },
                                      child: Container(
                                        height: 44,
                                        width: 150,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              ConstantColors.mainColor,
                                              ConstantColors.mainColor2,
                                              ConstantColors.mainColor3,
                                            ],
                                          ),
                                        ),
                                        child: Text(
                                          "Rating",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: ConstantColors.whiteColor,
                                          ),
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
                    ],
                  ),
                );
              } else {
                return Column(
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
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
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
                                            Paths.imageAssets(
                                                "planelinebox.png"),
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
                                    top: isPortrait ? 90 : 150,
                                    left: isPortrait ? 60 : 60,
                                    right: isPortrait ? 60 : 60,
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
                                        height: 50,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(left: 5),
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                      255, 77, 75, 75)
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
                                                      "Report Deal",
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
                      height: isPortrait
                          ? MediaQuery.of(context).size.height - 188
                          : 706,
                      decoration: BoxDecoration(
                        color: ConstantColors.whiteColor,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 6, bottom: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(255, 77, 75, 75)
                                              .withOpacity(
                                                  0.2), //color of shadow
                                          spreadRadius: 1, //spread radius
                                          blurRadius: 3, // blur radius
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 64,
                                              height: 64,
                                              child: ClipOval(
                                                child: Image.asset(
                                                  Paths.imageAssets(
                                                      "profile5.jpg"),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Emma Samir",
                                                  style: TextStyle(
                                                      color: ConstantColors
                                                          .mainlyTextColor,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                                  255,
                                                                  77,
                                                                  75,
                                                                  75)
                                                              .withOpacity(
                                                                  0.4), //color of shadow
                                                          spreadRadius:
                                                              1, //spread radius
                                                          blurRadius:
                                                              4, // blur radius
                                                          offset: Offset(0, 3),
                                                        ),
                                                      ],
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
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
                                                    width: 85,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7,
                                                              right: 7,
                                                              top: 5,
                                                              bottom: 4),
                                                      child: Text(
                                                        "Chat",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12),
                                                      ),
                                                    )))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(255, 77, 75, 75)
                                              .withOpacity(
                                                  0.2), //color of shadow
                                          spreadRadius: 1, //spread radius
                                          blurRadius: 3, // blur radius
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "Traveler Reward",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text("\$90.11",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: ConstantColors
                                                            .mainColor)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Start Date",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text("May 3, 2023 19:29",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: ConstantColors
                                                            .mainColor)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Deal Method",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text("Shopper Buy",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: ConstantColors
                                                            .mainColor)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        MySeparator(color: Colors.grey),
                                        Container(
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 18,
                                                  ),
                                                  CircleIcon(),
                                                  VerticalLineSteps(),
                                                  CircleWrongIcon(),
                                                  VerticalLineSteps(),
                                                  CircleInactiveIcon(),
                                                  VerticalLineSteps(),
                                                  CircleIcon(),
                                                  SizedBox(
                                                    height: 18,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 14,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 18,
                                                  ),
                                                  Text(
                                                    "The shopper has made the payment.",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: ConstantColors
                                                            .darkGreyColor),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    "The Traveler picked up the item.",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: ConstantColors
                                                            .darkGreyColor),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    "The shopper confirmed the delivery.",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: ConstantColors
                                                            .darkGreyColor),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    "Rate the traveler.",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: ConstantColors
                                                            .darkGreyColor),
                                                  ),
                                                  SizedBox(
                                                    height: 18,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        MySeparator(color: Colors.grey),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Product Price",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  "Tax or Shipping",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  "Traveler Reward",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text("Traveler Deals fee"),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  "Payment processor",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                GradientText(
                                                  text: "Total Amount",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
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
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "\$109.25",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  "\5",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  "\$18.20",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  "\$3.25",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  "\$6.50",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                GradientText(
                                                  text: "\$124.99",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
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
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        //  VerticalStepIndicator(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                  top: BorderSide(
                                      color: Color(0xFFE2E2E2), width: 1)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 29, top: 29),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _showBottomDrawerQr(context);
                                    },
                                    child: Container(
                                      height: 44,
                                      width: 150,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            ConstantColors.mainColor,
                                            ConstantColors.mainColor2,
                                            ConstantColors.mainColor3,
                                          ],
                                        ),
                                      ),
                                      child: Text(
                                        "Show QR Code",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: ConstantColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _showBottomDrawer(context);
                                    },
                                    child: Container(
                                      height: 44,
                                      width: 150,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            ConstantColors.mainColor,
                                            ConstantColors.mainColor2,
                                            ConstantColors.mainColor3,
                                          ],
                                        ),
                                      ),
                                      child: Text(
                                        "Rating",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: ConstantColors.whiteColor,
                                        ),
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
                  ],
                );
              }
            }),
          );
        }),
      ),
    );
  }
}

class VerticalLineSteps extends StatelessWidget {
  const VerticalLineSteps({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 1.5,
      decoration: BoxDecoration(
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
    );
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18.0, // Width of the circle
      height: 18.0,
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
        shape: BoxShape.circle,
      ), // Height of the circle

      child: Icon(
        Icons.check,
        size: 12, // Icon to be displayed inside the circle
        color: Colors.white, // Color of the icon
      ),
    );
  }
}

class CircleWrongIcon extends StatelessWidget {
  const CircleWrongIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18.0, // Width of the circle
      height: 18.0,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Color.fromARGB(255, 255, 0, 0),
            Color.fromARGB(255, 244, 0, 0),
            Color.fromARGB(255, 255, 0, 0),
          ],
        ),
        shape: BoxShape.circle,
      ), // Height of the circle

      child: Icon(
        Icons.close,
        size: 12, // Icon to be displayed inside the circle
        color: Colors.white, // Color of the icon
      ),
    );
  }
}

class CircleInactiveIcon extends StatelessWidget {
  const CircleInactiveIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18.0, // Width of the circle
      height: 18.0,
      decoration: const BoxDecoration(
        color: ConstantColors.darkGreyColor,
        shape: BoxShape.circle,
      ), // Height of the circle

      child: Icon(
        Icons.check,
        size: 12, // Icon to be displayed inside the circle
        color: Colors.white, // Color of the icon
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
        const dashWidth = 3.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2.5 * dashWidth)).floor();
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

class VerticalStepIndicator extends StatefulWidget {
  const VerticalStepIndicator({Key? key}) : super(key: key);

  @override
  _VerticalStepIndicatorState createState() => _VerticalStepIndicatorState();
}

class _VerticalStepIndicatorState extends State<VerticalStepIndicator> {
  int currentStep = 0;

  List<Step> steps = [
    Step(
      title: const Text('Step 1'),
      content: Text('Step 1'),
      isActive: true,
    ),
    Step(
      title: const Text('Step 2'),
      content: const Text('This is the content of Step 2'),
      isActive: false,
    ),
    Step(
      title: const Text('Step 3'),
      content: const Text('This is the content of Step 3'),
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: currentStep,
      onStepTapped: (step) {
        setState(() {
          currentStep = step;
        });
      },
      steps: steps,
      type: StepperType.vertical,
    );
  }
}
