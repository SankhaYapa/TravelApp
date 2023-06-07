import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler/screens/dashboad_screen/home_screen/tab_screens/home_orders.dart';
import 'package:traveler/screens/dashboad_screen/home_screen/tab_screens/home_trips.dart';
import 'package:traveler/screens/sub_screens/outgoing_order_requests/outgoing_tab_screens/incomming_offer_inactive.dart';
import 'package:traveler/screens/sub_screens/outgoing_order_requests/outgoing_tab_screens/incomming_offers.dart';
import 'package:traveler/screens/sub_screens/outgoing_order_requests/outgoing_tab_screens/outgoing_order_request.dart';
import 'package:traveler/screens/sub_screens/send_offer_screen/send_offer.dart';
import 'dart:math';

import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/widgets/common.dart';
import 'package:traveler/widgets/main_btn.dart';
import '../../../widgets/custom_images.dart';

class OutGoingOrderScreen extends StatefulWidget {
  const OutGoingOrderScreen({Key? key}) : super(key: key);

  @override
  _OutGoingOrderScreenState createState() => _OutGoingOrderScreenState();
}

bool isChecked = false;
bool _shopperChecked = false;
bool _travelerChecked = false;
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
        return FadeInUp(
          child: Container(
            height: 711,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 23),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
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
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: ConstantColors.mainColor,
                  activeColor: Colors.white,
                  side: BorderSide(
                    color: ConstantColors.darkGreyColor,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  value: _shopperChecked,
                  onChanged: (value) {
                    setState(() {
                      _shopperChecked = value!;
                    });
                  },
                  title: Text(
                    'Shopper Buy',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: ConstantColors.mainColor,
                  activeColor: Colors.white,
                  side: BorderSide(
                    color: ConstantColors.darkGreyColor,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  value: _travelerChecked,
                  onChanged: (value) {
                    setState(() {
                      _travelerChecked = value!;
                    });
                  },
                  title: Text(
                    'Traveler Buy',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Divider(
                  color: ConstantColors.greyColor,
                  height: 0,
                  thickness: 1,
                  indent: 5,
                  endIndent: 5,
                ),
                SizedBox(
                  height: 170,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: MainBtn(
                    onTap: () {},
                    text: "Search",
                    borderRadius: BorderRadius.circular(10),
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

class _OutGoingOrderScreenState extends State<OutGoingOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
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
              child: Container(
                alignment: Alignment.topCenter,
                width: size.width,
                height: size.height,
                color: Colors.black12,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    IncommingOffersScreen(),
                    IncommingOfferInactive(),
                    OutGoingOrderRequest(),
                  ],
                ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Text(
                  'Here the order title will appear ...',
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
                IconButton(
                    onPressed: () {
                      _toggleContainerVisibility();
                    },
                    icon: showIcon
                        ? Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.white,
                          )
                        : Icon(null)),
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
                Padding(
                  padding:
                      EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                  child: Container(
                    height: 44,
                    // decoration: BoxDecoration(
                    //   color: Color.fromRGBO(188, 22, 122, 0.2),
                    //   borderRadius: BorderRadius.circular(
                    //     25.0,
                    //   ),
                    // ),
                    alignment: Alignment.center,
                    child: TabBar(
                      unselectedLabelColor: Colors.black,
                      unselectedLabelStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                      labelColor: ConstantColors.mainColor,
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                      indicatorColor: Color.fromRGBO(255, 204, 0, 0),
                      indicatorWeight: 3,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                      ),
                      controller: widget.tabController,
                      tabs: [
                        Tab(
                          child: Container(
                            width: 75,
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
                                  "Active",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "2",
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
                            width: 75,
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            width: 75,
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
                                  "Accepted",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
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
