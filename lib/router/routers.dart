import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:traveler/router/route_constant.dart';
import 'package:traveler/screens/auth_screens/auth_screen.dart';
import 'package:traveler/screens/dashboad_screen/dashboard_screen.dart';
import 'package:traveler/screens/splash/splash_screen.dart';

import '../screens/auth_screens/sign_in/sign_in_screen.dart';
import '../screens/auth_screens/sign_up/confirm_mobile_number_screen.dart';
import '../screens/auth_screens/sign_up/sign_up_screen.dart';
import '../screens/auth_screens/sign_up/verify_phone_number_screen.dart';

class Routers {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      // Auth Routes
      case authRoute:
        return PageTransition(
          child: const AuthScreen(),
          type: PageTransitionType.rightToLeft,
        );

      // Sign In Route
      case signInRoute:
        return PageTransition(
          child: const SignInScreen(),
          type: PageTransitionType.rightToLeft,
        );

      // Sign Up Routes
      case signUpRoute:
        return PageTransition(
          child: const SignUpScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case confirmMobileNumberRoute:
        return PageTransition(
          child: const ConfirmMobileNumberScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case verifyPhoneNumberRoute:
        return PageTransition(
          child: const VerifyPhoneNumberScreen(),
          type: PageTransitionType.rightToLeft,
        );

      // Forgot Password Routes
      // case forgotPasswordRoute:
      //   return PageTransition(
      //     child: const ForgotPasswordScreen(),
      //     type: PageTransitionType.rightToLeft,
      //   );

      // case verificationForgotPasswordRoute:
      //   return PageTransition(
      //     child: const VerificationForgotPasswordScreen(),
      //     type: PageTransitionType.rightToLeft,
      //   );

      // case changeForgotPasswordRoute:
      //   return PageTransition(
      //     child: const ChangeForgotPasswordScreen(),
      //     type: PageTransitionType.rightToLeft,
      //   );

      // Main Routes
      case dashboardRoute:
        return PageTransition(
          child: const DashboardScreen(),
          type: PageTransitionType.rightToLeft,
        );

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
