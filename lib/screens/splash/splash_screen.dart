import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler/router/route_constant.dart';
import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _getToken() async {
    // String? token = LocalStorage.getItem(FCM_TOKEN);

    // if (token != null) {
    //   Provider.of<FCMService>(context, listen: false)
    //       .addFCMToken(fcmToken: token);
    // }

    // if (token == null) {
    //   String? fcmToken = await _firebaseMessaging.getToken();
    //   if (fcmToken != null) {
    //     // ignore: use_build_context_synchronously
    //     Provider.of<FCMService>(context, listen: false)
    //         .addFCMToken(fcmToken: fcmToken);
    //     await LocalStorage.setItem(FCM_TOKEN, fcmToken);
    //   }
    // }
  }

  _getData() {}

  @override
  void initState() {
    _getToken();
    _getData();

    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
        context,
        authRoute,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.bgColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              ConstantColors.mainColor,
              ConstantColors.mainColor2,
              ConstantColors.mainColor3,
              ConstantColors.mainColor3,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(Paths.imageAssets("logo.png"))],
          ),
        ),
      ),
    );
  }
}
