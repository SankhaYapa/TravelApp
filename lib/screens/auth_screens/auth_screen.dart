import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traveler/router/route_constant.dart';
import 'package:traveler/screens/auth_screens/sign_in/sign_in_screen.dart';
import 'package:traveler/screens/auth_screens/sign_up/sign_up_screen.dart';
import 'package:traveler/values/paths.dart';
import 'package:traveler/values/util_function.dart';

import '../../values/constant_colors.dart';
import '../../widgets/gradient_text.dart';
import '../../widgets/main_btn.dart';
import '../../widgets/my_behavior.dart';
import '../../widgets/outline_btn.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 75),
              Stack(
                children: [
                  Positioned(
                    top: 4,
                    child: Text(
                      "Traverler Deals",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: ConstantColors.mainColor.withOpacity(0.3),
                      ),
                    ),
                  ),
                  const GradientText(
                    text: "Traverler Deals",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        ConstantColors.mainColor,
                        ConstantColors.mainColor2,
                        ConstantColors.mainColor3,
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const GradientText(
                text: "Shop Worldwide Effortlessly!",
                style: TextStyle(
                  fontSize: 16,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    ConstantColors.mainColor,
                    ConstantColors.mainColor2,
                    ConstantColors.mainColor3,
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Image.asset(Paths.imageAssets("logo.png")),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 244,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        decoration: BoxDecoration(
          color: ConstantColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: ConstantColors.mainColor.withOpacity(0.2),
              blurRadius: 10.0,
              spreadRadius: 0.0,
              offset: const Offset(
                0.0,
                -2.0,
              ),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            MainBtn(
              onTap: () {
                UtilFunction.navigateTo(context, SignUpScreen());
              },
              text: "Sign Up",
              borderRadius: BorderRadius.circular(60),
            ),
            const SizedBox(height: 15),
            OutlineBtn(
              onTap: () {
                UtilFunction.navigateTo(context, SignInScreen());
              },
              text: "Sign In",
            ),
          ],
        ),
      ),
    );
  }
}
