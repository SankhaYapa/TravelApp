import 'package:flutter/material.dart';
import 'package:traveler/screens/sub_screens/pre_payment_review/pre_payment_review.dart';
import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/paths.dart';
import 'package:traveler/values/util_function.dart';

class CustomPayNowCard extends StatelessWidget {
  const CustomPayNowCard(
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
                    .withOpacity(0.2), //color of shadow
                spreadRadius: 2, //spread radius
                blurRadius: 5, // blur radius
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 184,
                width: size.width - 1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 77, 75, 75)
                          .withOpacity(0.4), //color of shadow
                      spreadRadius: 1, //spread radius
                      blurRadius: 4, // blur radius
                      offset: Offset(0, 3),
                    ),
                  ],
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
                  height: 184,
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
                                width: size.width / 3.5,
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
                                              fontSize: 10),
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
                              Container(
                                width: size.width / 3.5,
                                child: Column(
                                  children: [
                                    Text(
                                      "Traveler Reward",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "\$90.11",
                                      style: TextStyle(
                                          color: ConstantColors.mainColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: size.width / 3.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Expire In",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Expired",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: ConstantColors.mainColor,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  UtilFunction.navigateTo(
                                      context, PrePaymentScreen());
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 25, right: 25, top: 6, bottom: 6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: ConstantColors.green),
                                  child: Text(
                                    "Pay Now",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          )
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
