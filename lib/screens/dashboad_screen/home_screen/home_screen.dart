import 'package:animate_do/animate_do.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler/screens/dashboad_screen/home_screen/tab_screens/home_orders.dart';
import 'package:traveler/screens/dashboad_screen/home_screen/tab_screens/home_trips.dart';
import 'dart:math';

import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/widgets/common.dart';
import 'package:traveler/widgets/main_btn.dart';
import 'package:traveler/widgets/sub_btn.dart';
import '../../../widgets/custom_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

bool isChecked = false;
bool _shopperChecked = true;
bool _travelerChecked = true;

void _showBottomDrawer(BuildContext context) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 53,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          size: 24,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 34,
                              ),
                              DrawerTextField(
                                text: "From",
                                icon: Icon(
                                  Icons.flight_takeoff,
                                  color: ConstantColors.mainColor,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DrawerTextField(
                                text: "To",
                                icon: Icon(
                                  Icons.flight_land,
                                  color: ConstantColors.mainColor,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DrawerTextField(
                                text: "Before Date",
                                icon: Icon(
                                  Icons.calendar_month_outlined,
                                  color: ConstantColors.mainColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: ConstantColors.greyColor,
                        height: 0,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Deal Method",
                                style: TextStyle(
                                    color: ConstantColors.mainlyTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            CustomCheckBox(
                              value: _shopperChecked,
                              shouldShowBorder: true,
                              borderColor: ConstantColors.mainlyTextColor,
                              checkedFillColor:
                                  Color.fromARGB(255, 255, 254, 253),
                              checkedIconColor: ConstantColors.mainColor,
                              borderRadius: 5,
                              borderWidth: 2,
                              checkBoxSize: 19,
                              onChanged: (val) {
                                //do your stuff here
                                setState(() {
                                  _shopperChecked = val;
                                });
                              },
                            ),
                            Text(
                              "Shopper Buy",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: ConstantColors.mainlyTextColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            CustomCheckBox(
                              value: _travelerChecked,
                              shouldShowBorder: true,
                              borderColor: ConstantColors.mainlyTextColor,
                              checkedFillColor:
                                  Color.fromARGB(255, 255, 254, 253),
                              checkedIconColor: ConstantColors.mainColor,
                              borderRadius: 5,
                              borderWidth: 2,
                              checkBoxSize: 19,
                              onChanged: (val) {
                                //do your stuff here
                                setState(() {
                                  _travelerChecked = val;
                                });
                              },
                            ),
                            Text(
                              "Traveler Buy",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: ConstantColors.greyColor,
                        height: 0,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ],
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
                      onTap: () {},
                      text: "Search",
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

class DrawerTextField extends StatelessWidget {
  const DrawerTextField({
    required this.text,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final String text;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: TextInputType.visiblePassword,
        autocorrect: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, right: 30),
          filled: true,
          fillColor: ConstantColors.lightGreyColor,
          hintText: text,
          suffixIcon: icon,
          hintStyle: const TextStyle(
            color: ConstantColors.darkGreyColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
        ));
  }
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var common = Provider.of<Common>(context, listen: false);
    return Scaffold(
        backgroundColor: ConstantColors.whiteColor,
        // appBar: PreferredSize(
        //   preferredSize: Size(double.infinity, 90),
        //   child: AppBar(
        //     centerTitle: true,
        //     title: Text(
        //       'Traveler Deals',
        //       style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        //     ),
        //     flexibleSpace: Container(),
        //     leading: IconButton(
        //       icon: CustomSvg(
        //         svgName: "profile",
        //       ),
        //       onPressed: () {
        //         // Add your onPressed logic here
        //       },
        //     ),
        //     actions: <Widget>[
        //       IconButton(
        //         icon: CustomSvg(
        //           svgName: "search",
        //         ),
        //         onPressed: () {
        //           // Add your onPressed logic here
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        body: Column(
          children: [
            HeaderBar(size: size, tabController: tabController),
            SizedBox(
              height: 43,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                width: size.width,
                height: size.height,
                color: Colors.black12,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Orders(),
                    Trip(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key? key,
    required this.size,
    required this.tabController,
  }) : super(key: key);

  final Size size;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: size.width,
          height: 127,
          decoration: BoxDecoration(
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSvg(
                  svgName: "profile",
                  width: 37,
                  height: 37,
                ),
                Text(
                  'Traveler Deals',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _showBottomDrawer(context);
                  },
                  child: CustomSvg(
                    svgName: "search",
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Positioned(
          top: 95,
          width: MediaQuery.of(context).size.width - 16,
          child: Container(
            height: 66,
            width: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 77, 75, 75)
                      .withOpacity(0.1), //color of shadow
                  spreadRadius: 3, //spread radius
                  blurRadius: 5, // blur radius
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(188, 22, 122, 0.2),
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                    child: TabBar(
                      unselectedLabelColor: Colors.black,
                      unselectedLabelStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                      labelColor: Colors.white,
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                      indicatorColor: Color.fromRGBO(255, 204, 0, 0),
                      indicatorWeight: 2,
                      indicator: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0067, 0.3146, 0.9859],
                          colors: [
                            Color(0xFF8922B8),
                            Color(0xFFBC167A),
                            Color(0xFFBE1279),
                          ],
                          // transform: GradientRotation(262.43 * math.pi / 180),
                        ),
                        borderRadius: BorderRadius.circular(36),
                      ),
                      controller: tabController,
                      tabs: [
                        Tab(
                          text: 'Orders',
                        ),
                        Tab(
                          text: 'Trips',
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
    );
  }
}
