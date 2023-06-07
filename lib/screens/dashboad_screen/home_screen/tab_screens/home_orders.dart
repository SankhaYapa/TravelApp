import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler/screens/sub_screens/order_details_screen/order_details.dart';

import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/paths.dart';
import 'package:traveler/values/util_function.dart';

import '../../../../widgets/custom_images.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double Myfont = size.width * 0.03;
    double starIcon = size.width * 0.03;

    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomOrderWidget(
              size: size,
              name: "HOME IT Mop And Broom Holder",
              mainImg: "product1.jpg",
              prfleImg: "profile5.jpg",
              ontap: () {
                UtilFunction.navigateTo(context, const OrderDetailsScreen());
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomOrderWidget(
              size: size,
              name: "JULY HOME Gravity Electric Salt",
              mainImg: "product2.jpg",
              prfleImg: "profile2.jpg",
              ontap: () {
                UtilFunction.navigateTo(context, const OrderDetailsScreen());
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomOrderWidget(
              size: size,
              name: "YIOU Air Purifiers for Home Large",
              mainImg: "product3.jpg",
              prfleImg: "profile2.jpg",
              ontap: () {
                UtilFunction.navigateTo(context, const OrderDetailsScreen());
              },
            ),
            const SizedBox(
              height: 10,
            ),
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
        ),
      ),
    );
  }
}

class CustomOrderWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double Myfont = size.width * 0.03;
    double starIcon = size.width * 0.03;
    return GestureDetector(
      onTap: ontap,
      child: AspectRatio(
        aspectRatio: 34 / 14,
        child: Container(
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
                child: Container(
                  child: Image.asset(
                    'assets/images/product1.jpg',
                    fit: BoxFit.cover,
                  ),
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
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'JULY HOME Gravity Electric Salt ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Myfont,
                              color: Color(0xFF313131),
                            ),
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
                                child: Text(
                                  'Cairo',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: Myfont,
                                    color: Color(0xFF313131),
                                  ),
                                ),
                              )),
                              RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(
                                    Icons.airplanemode_active,
                                    size: starIcon + 10,
                                    color: Color(0xFFBE1279),
                                  )),
                              Expanded(
                                  child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Damascus',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: Myfont,
                                    color: Color(0xFF313131),
                                  ),
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
                                        color: Color(0xFF313131),
                                        size: starIcon + 2,
                                      ),
                                      Text(
                                        'Before',
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
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
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
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
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
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
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
                        flex: 1,
                        child: Divider(
                          height: 0,
                          color: Color(0xFFCCCCCC),
                          thickness: 1,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          /* starts name profile image and button main Container*/
                          child: Row(
                            children: [
                              Expanded(
                                flex: 121,
                                child: Container(
                                  /* starts name profile image and button Expanded Container*/
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 33,
                                        child: Container(
                                          // color: Colors.amber,
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.all(2),
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/profile5.jpg'),
                                            backgroundColor: Colors.transparent,
                                            radius: double.infinity,
                                            child: ClipOval(
                                              child: Image.asset(
                                                'assets/images/profile5.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 67,
                                        child: Container(
                                          /* starts and name column*/
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 50,
                                                child: Container(
                                                  /* name row*/
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    'Amir Alobied',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF313131),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: Myfont),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                /* starts row*/
                                                flex: 50,
                                                child: Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xFFF2AE00),
                                                        size: starIcon + 2,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xFFF2AE00),
                                                        size: starIcon + 2,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xFFF2AE00),
                                                        size: starIcon + 2,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xFFF2AE00),
                                                        size: starIcon + 2,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xFFF2AE00),
                                                        size: starIcon + 2,
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
                              Expanded(
                                flex: 75,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // تعليمات الضغط على الزر
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      onSurface: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 6,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF8922B8),
                                            Color(0xFFBC167A),
                                            Color(0xFFBE1279),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xFF4D4B4B)
                                                .withOpacity(0.4),
                                            spreadRadius: 1,
                                            blurRadius: 4,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: Text(
                                          'Send Offer',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: Myfont,
                                          ),
                                        ),
                                      ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
