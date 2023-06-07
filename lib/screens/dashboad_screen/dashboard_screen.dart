import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler/screens/dashboad_screen/more_screen/more_screen.dart';
import 'package:traveler/screens/dashboad_screen/myorders_screen/myorders_screen.dart';
import 'package:traveler/screens/dashboad_screen/mytrips_screen/mytrips_screen.dart';

import 'package:traveler/values/paths.dart';

import '../../values/constant_colors.dart';
import '../../widgets/common.dart';

import 'home_screen/home_screen.dart';
import 'inbox_screen/inbox_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
    this.initialIndex = 0,
  }) : super(key: key);
  final int initialIndex;
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    MyTrips(),
    Myorders(),
    InboxScreen(),
    MoreScreen(),
  ];
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  void _onPageChanged(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    var common = Provider.of<Common>(context, listen: false);

    return Scaffold(
      extendBody: true,
      body: _screens[_selectIndex],
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: ConstantColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 4.0,
                    spreadRadius: 0.0,
                    offset: const Offset(
                      4.0,
                      0.0,
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    common.bottomNavigationSelectedItem(
                      onTap: () => _onPageChanged(0),
                      index: 0,
                      context: context,
                      selectedIndex: _selectIndex,
                      icon: Paths.iconNavBaAssets("Home.png"),
                      iconWhite: Paths.iconNavBaAssets("Home.png"),
                      text: "Home",
                    ),
                    common.bottomNavigationSelectedItem(
                      onTap: () => _onPageChanged(1),
                      index: 1,
                      context: context,
                      selectedIndex: _selectIndex,
                      icon: Paths.iconNavBaAssets("Trips.png"),
                      iconWhite: Paths.iconNavBaAssets("Trips.png"),
                      text: "My Trips",
                    ),
                    common.bottomNavigationSelectedItem(
                      onTap: () => _onPageChanged(2),
                      index: 2,
                      context: context,
                      selectedIndex: _selectIndex,
                      icon: Paths.iconNavBaAssets("Orders.png"),
                      iconWhite: Paths.iconNavBaAssets("Orders.png"),
                      text: "My Orders",
                    ),
                    common.bottomNavigationSelectedItem(
                      onTap: () => _onPageChanged(3),
                      index: 3,
                      context: context,
                      selectedIndex: _selectIndex,
                      icon: Paths.iconNavBaAssets("Inbox.png"),
                      iconWhite: Paths.iconNavBaAssets("Inbox.png"),
                      text: "Inbox",
                    ),
                    common.bottomNavigationSelectedItem(
                      onTap: () => _onPageChanged(4),
                      index: 4,
                      context: context,
                      selectedIndex: _selectIndex,
                      icon: Paths.iconNavBaAssets("More.png"),
                      iconWhite: Paths.iconNavBaAssets("More.png"),
                      text: "More",
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
