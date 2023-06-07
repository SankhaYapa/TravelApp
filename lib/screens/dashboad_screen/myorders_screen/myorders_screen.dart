import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler/screens/dashboad_screen/home_screen/tab_screens/home_orders.dart';
import 'package:traveler/screens/dashboad_screen/home_screen/tab_screens/home_trips.dart';
import 'package:traveler/screens/dashboad_screen/myorders_screen/myorders_tab_screens/myorders_in_transit.dart';
import 'package:traveler/screens/dashboad_screen/myorders_screen/myorders_tab_screens/myorders_inactive.dart';
import 'package:traveler/screens/sub_screens/outgoing_order_requests/outgoing_tab_screens/incomming_offer_inactive.dart';
import 'package:traveler/screens/sub_screens/outgoing_order_requests/outgoing_tab_screens/incomming_offers.dart';
import 'package:traveler/screens/sub_screens/outgoing_order_requests/outgoing_tab_screens/outgoing_order_request.dart';
import 'package:traveler/screens/sub_screens/send_offer_screen/send_offer.dart';
import 'dart:math';

import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/paths.dart';
import 'package:traveler/widgets/common.dart';
import 'package:traveler/widgets/main_btn.dart';
import '../../../widgets/custom_images.dart';

import 'myorders_tab_screens/myorders_recieved.dart';
import 'myorders_tab_screens/myorders_requested.dart';

class Myorders extends StatefulWidget {
  const Myorders({Key? key}) : super(key: key);

  @override
  _MyordersState createState() => _MyordersState();
}

bool isChecked = false;
bool _shopperChecked = false;
bool _travelerChecked = false;

class _MyordersState extends State<Myorders>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final bool showicon = false;
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
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: size.width,
                    height: size.height,
                    color: Colors.black12,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        MyOrdersRequested(),
                        MyOrdersInTransist(),
                        MyOrdersRecived(),
                        MyOrdersInactive(),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 160,
                      right: 18,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 6,
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(255, 240, 240, 240),
                                    width: 4,
                                  ),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      ConstantColors.mainColor,
                                      ConstantColors.mainColor2,
                                      ConstantColors.mainColor3,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ConstantColors.whiteColor,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}

class HeaderBar extends StatefulWidget {
  const HeaderBar({
    Key? key,
    required this.size,
    required this.tabController,
  }) : super(key: key);

  final Size size;
  final TabController tabController;

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  bool showIcon = true;
  bool showContainer = false;
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(handleTabSelection);
  }

  @override
  void dispose() {
    widget.tabController.removeListener(handleTabSelection);
    super.dispose();
  }

  void handleTabSelection() {
    setState(() {
      showIcon = showIcon = widget.tabController.index != 2;
    });
  }

  void toggleContainerVisibility() {
    setState(() {
      showContainer = !showContainer;
    });
  }

  bool isContainerVisible = false;
  void _toggleContainerVisibility() {
    setState(() {
      isContainerVisible = !isContainerVisible;
    });
  }

  void _toggleContainerVisibilityHide() {
    setState(() {
      isContainerVisible = false;
    });
  }

  bool showSmallContainer = false;

  String _getSelectedTabText(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return 'Requested';
      case 1:
        return 'In Transit';
      case 2:
        return 'Received';
      case 3:
        return 'Inactive';
      default:
        return 'Requested';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: widget.size.width,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'My Orders - ${_getSelectedTabText(widget.tabController.index)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    // shadows: [
                    //   Shadow(
                    //     blurRadius: 4,
                    //     color: Color.fromRGBO(0, 0, 0, 0.25),
                    //     offset: Offset(0, 4),
                    //   ),
                    // ],
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
            alignment: Alignment.center,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonsTabBar(
                  controller: widget.tabController,
                  splashColor: Colors.white,
                  unselectedBackgroundColor: Colors.white,
                  unselectedLabelStyle: TextStyle(color: Colors.black),
                  backgroundColor: Colors.white,

                  // labelStyle: TextStyle(
                  //     color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5.1,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
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
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Text("Requested",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: widget.tabController.index == 0
                                      ? ConstantColors.mainColor
                                      : Colors.black,
                                )),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "2",
                              style: TextStyle(
                                color: ConstantColors.darkGreyColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5.1,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
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
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "In Transit",
                              style: TextStyle(
                                  color: widget.tabController.index == 1
                                      ? ConstantColors.mainColor
                                      : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                  color: ConstantColors.darkGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5.1,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
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
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Received",
                              style: TextStyle(
                                  color: widget.tabController.index == 2
                                      ? ConstantColors.mainColor
                                      : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "21",
                              style: TextStyle(
                                  color: ConstantColors.darkGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5.1,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
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
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Inactive",
                              style: TextStyle(
                                  color: widget.tabController.index == 3
                                      ? ConstantColors.mainColor
                                      : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "3",
                              style: TextStyle(
                                  color: ConstantColors.darkGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 60,
          right: 40,
          child: Visibility(
            visible: isContainerVisible,
            child: Container(
              width: 180,
              height: 90,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 77, 75, 75)
                        .withOpacity(0.4), //color of shadow
                    spreadRadius: 1, //spread radius
                    blurRadius: 4, // blur radius
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.file_download_outlined,
                            color: ConstantColors.mainlyTextColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Incomming Offer",
                            style: TextStyle(
                                fontSize: 15,
                                color: ConstantColors.mainlyTextColor,
                                fontWeight: FontWeight.w500),
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
                          Icons.file_upload_outlined,
                          color: ConstantColors.mainlyTextColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Outgoing Requests",
                          style: TextStyle(
                              fontSize: 15,
                              color: ConstantColors.mainlyTextColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTab(String title, String subtitle, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.blue : Colors.black,
          ),
        ),
        SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.blue : Colors.grey,
          ),
        ),
        SizedBox(height: 8),
        isActive
            ? Container(
                height: 2,
                width: 30,
                color: Colors.blue,
              )
            : Container(),
      ],
    );
  }
}
