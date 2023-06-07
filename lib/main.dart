import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:traveler/screens/auth_screens/forgot_password/change_forgot_password_screen.dart';
import 'package:traveler/screens/auth_screens/forgot_password/forgot_password_screen.dart';
import 'package:traveler/screens/auth_screens/forgot_password/verification_forgot_password_screen.dart';
import 'package:traveler/screens/auth_screens/sign_in/sign_in_screen.dart';
import 'package:traveler/screens/auth_screens/sign_up/confirm_mobile_number_screen.dart';
import 'package:traveler/screens/auth_screens/sign_up/sign_up_screen.dart';
import 'package:traveler/screens/auth_screens/sign_up/verify_email_address_screen.dart';
import 'package:traveler/screens/auth_screens/sign_up/verify_phone_number_screen.dart';

import 'package:traveler/screens/dashboad_screen/dashboard_screen.dart';

import 'package:traveler/screens/splash/splash_screen.dart';
import 'package:traveler/screens/sub_screens/account_traveler/account_traveler.dart';
import 'package:traveler/screens/sub_screens/choose_trip_screen/choose_trip_screen.dart';
import 'package:traveler/screens/sub_screens/edit_profile_screens/edit_profile.dart';
import 'package:traveler/screens/sub_screens/matching_trips_screen/matching_trips_screen.dart';
import 'package:traveler/screens/sub_screens/newTripFAQ/newTripFAQ.dart';

import 'package:traveler/screens/sub_screens/order_review_screen/order_review_screen.dart';
import 'package:traveler/screens/sub_screens/outgoing_order_requests/outgoing_order_main.dart';
import 'package:traveler/screens/sub_screens/pre_payment_review/pre_payment_review.dart';
import 'package:traveler/screens/sub_screens/send_offer_screen/send_offer.dart';
import 'package:traveler/screens/sub_screens/tracking_shopper_screen/tracking_shopper_screen.dart';
import 'package:traveler/screens/sub_screens/trip_details_screen/trip_details_screen.dart';

import 'package:traveler/widgets/common.dart';

import 'screens/auth_screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Common()),
        // Helpers
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 800),
          //minTextAdapt: true,
          splitScreenMode: true,
          // useInheritedMediaQuery: true,
          builder: (context, snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: AuthScreen(),
            );
          }),
    );
  }
}
