import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:traveler/router/route_constant.dart';
import 'package:traveler/screens/auth_screens/forgot_password/forgot_password_screen.dart';
import 'package:traveler/screens/dashboad_screen/dashboard_screen.dart';
import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/paths.dart';
import 'package:traveler/values/util_function.dart';
import 'package:traveler/widgets/common.dart';
import 'package:traveler/widgets/main_btn.dart';

import '../../../widgets/gradient_text.dart';
import '../../../widgets/my_behavior.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    var common = Provider.of<Common>(context, listen: false);

    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          height: 830,
          child: Column(
            children: [
              Expanded(
                child: Column(
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
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 330,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 30, bottom: 30),
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
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      decoration: common.inputDecoration(
                        hintText: "Email",
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      autocorrect: false,
                      obscureText: _isObscure,
                      decoration: common.inputDecoration(
                        hintText: "Password",
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Image.asset(
                            _isObscure
                                ? 'assets/icons/eye.png'
                                : 'assets/icons/hideeye.png',
                            width: _isObscure ? 19.51 : 19.51,
                            height: _isObscure ? 9.25 : 18.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: MainBtn(
                        onTap: () {
                          UtilFunction.navigateTo(context, DashboardScreen());
                        },
                        text: "Login",
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        UtilFunction.navigateTo(
                            context, ForgotPasswordScreen());
                      },
                      child: const Text(
                        "Have you forgotten your password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ConstantColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
