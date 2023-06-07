import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:traveler/screens/sub_screens/send_offer_screen/send_offer.dart';

import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/paths.dart';
import 'package:traveler/values/util_function.dart';
import 'package:traveler/widgets/custom_images.dart';
import 'package:traveler/widgets/main_btn.dart';
import 'package:traveler/widgets/sub_btn.dart';

import '../../../router/route_constant.dart';
import '../../../widgets/common.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class Slide {
  Slide({required this.images});

  final List<String> images;
}

final List<Slide> slides = [
  Slide(
    images: [
      'assets/images/product3.jpg',
      'assets/images/product2.jpg',
      'assets/images/product5.png',
    ],
  ),
];

final List<Widget> sliders = slides
    .map(
      (slide) => FlutterCarousel(
        items: slide.images
            .map(
              (image) => ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
          //   aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          enableInfiniteScroll: true,
          pauseAutoPlayOnTouch: true,
          enlargeCenterPage: true,
          slideIndicator: CircularSlideIndicator(
            indicatorBackgroundColor: ConstantColors.mainColor,
            // Customize inactive indicator color
            currentIndicatorColor: ConstantColors.mainColor3,
          ),
        ),
      ),
    )
    .toList();

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
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
    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    double h;
    if (MediaQuery.of(context).size.height < 800) {
      h = MediaQuery.of(context).size.height - 88;
    } else {
      h = MediaQuery.of(context).size.height - 188;
    }
    late final TextStyle headlineStyle;
    if (screenWidth >= 1200) {
      headlineStyle = textTheme.displayLarge!;
    } else if (screenWidth >= 992) {
      headlineStyle = textTheme.displayMedium!;
    } else if (screenWidth >= 768) {
      headlineStyle = textTheme.displaySmall!;
    } else {
      headlineStyle = textTheme.titleLarge!;
    }
    double Myfont = size.width * 0.03;
    double starIcon = size.width * 0.03;
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
                        AspectRatio(
                          aspectRatio: 4 / 1.6,
                          child: Container(
                            width: size.width,
                            // height: isPortrait
                            //     ? 150
                            //     : MediaQuery.of(context).size.width / 3,
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
                                    top: isPortrait ? 91 : 170,
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            CustomSvg(
                                                svgName: "calender",
                                                color: Colors.white),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "before May 12, 2023",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ],
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
                                horizontal: 10, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 4 / 2.3,
                                  child: Container(
                                    width: size.width,
                                    height: 225,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            // width: size.width * 2 / 2.92,
                                            // height: size.width * 2 / 3,
                                            child: sliders[0],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          height: 225,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomBox(
                                                size: size,
                                                text1: "Reward",
                                                text2: "\$199.22",
                                                textsize: 18,
                                                color: ConstantColors.mainColor,
                                              ),
                                              CustomBox(
                                                  size: size,
                                                  text1: "Price",
                                                  text2: "\$109",
                                                  textsize: 18,
                                                  color: ConstantColors
                                                      .mainlyTextColor),
                                              CustomBox(
                                                  size: size,
                                                  text1: "Weight",
                                                  text2: "0.250 gr",
                                                  textsize: 18,
                                                  color: ConstantColors
                                                      .mainlyTextColor),
                                              CustomBox(
                                                  size: size,
                                                  text1: "Quantity",
                                                  text2: "1",
                                                  textsize: 18,
                                                  color: ConstantColors
                                                      .mainlyTextColor),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Home Master CFDGD2501-20BB Multi Gradient 25/10/5/1 Micron",
                                  style: TextStyle(
                                      color: ConstantColors.mainlyTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Category",
                                      style: TextStyle(
                                          color: ConstantColors.darkGreyColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Where To Buy",
                                      style: TextStyle(
                                          color: ConstantColors.darkGreyColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Cell Phones & Accessorie",
                                      style: TextStyle(
                                          color: ConstantColors.mainlyTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "www.amazon.com",
                                      style: TextStyle(
                                          color: ConstantColors.mainlyTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                MySeparator(color: Colors.grey),
                                SizedBox(
                                  height: 10,
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
                                                Paths.imageAssets(
                                                    "profile5.jpg"),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Emma Samir",
                                                style: TextStyle(
                                                    color: ConstantColors
                                                        .mainlyTextColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10),
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Deal Method",
                                          style: TextStyle(
                                              color:
                                                  ConstantColors.darkGreyColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Shopper Buy",
                                          style: TextStyle(
                                              color: ConstantColors
                                                  .mainlyTextColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                MySeparator(color: Colors.grey),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Shopper Note",
                                  style: TextStyle(
                                      color: ConstantColors.mainlyTextColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Make sure that the shipment arrives at least 48 hours before the flight",
                                  style: TextStyle(
                                      color: ConstantColors.darkGreyColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 2),
                                ),
                                // SizedBox(
                                //   height: 40,
                                // ),
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
                                UtilFunction.navigateTo(
                                    context, SendOfferScreen());
                              },
                              text: "Send Offer",
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
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  const CustomBox(
      {Key? key,
      required this.size,
      required this.text1,
      required this.text2,
      required this.textsize,
      required this.color})
      : super(key: key);

  final Size size;
  final String text1;
  final String text2;
  final double textsize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 4,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFBE1279),
                Color(0xFFBC167A),
                Color(0xFF8922B8),
              ],
              stops: [0.0, 0.3342, 0.8548],
              transform: GradientRotation(2.39),
            ),
          ),
        ),
        Positioned(
          left: 1,
          right: 1,
          top: 1,
          child: Container(
            width: size.width / 4,
            height: 48,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text1,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    text2,
                    style: TextStyle(
                        fontSize: textsize,
                        fontWeight: FontWeight.w500,
                        color: color),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
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
