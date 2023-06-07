import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:provider/provider.dart';
import 'package:traveler/router/route_constant.dart';
import 'package:traveler/screens/auth_screens/sign_in/sign_in_screen.dart';
import 'package:traveler/screens/auth_screens/sign_up/confirm_mobile_number_screen.dart';
import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/util_function.dart';
import 'package:traveler/widgets/common.dart';
import 'package:traveler/widgets/main_btn.dart';
import 'package:traveler/widgets/my_behavior.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:traveler/widgets/sub_btn.dart';
import '../../../widgets/gradient_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    var common = Provider.of<Common>(context, listen: false);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          height: 830,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
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
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 620,
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 44),
                    decoration: BoxDecoration(
                      color: ConstantColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: ConstantColors.mainColor.withOpacity(0.2),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                          offset: const Offset(
                            0.0,
                            -1.0,
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
                        const SizedBox(height: 15),
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
                        const SizedBox(height: 15),
                        IntlPhoneField(
                          decoration: common.inputDecoration(
                            hintText: "Mobile Number",
                          ),
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Flexible(
                              child: TextField(
                                keyboardType: TextInputType.name,
                                autocorrect: false,
                                decoration: common.inputDecoration(
                                  hintText: "First Name",
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Flexible(
                              child: TextField(
                                keyboardType: TextInputType.name,
                                autocorrect: false,
                                decoration: common.inputDecoration(
                                  hintText: "Last Name",
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          decoration: common.inputDecoration(
                            hintText: "Refer code",
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Email and phone number must be valid as they will be verified.",
                          style: TextStyle(
                            fontSize: 12,
                            color: ConstantColors.inputIconColor,
                          ),
                        ),
                        const SizedBox(height: 50),
                        RichText(
                          text: TextSpan(
                            text: "By creating an account, you agree to our ",
                            style: const TextStyle(
                              color: ConstantColors.mainlyTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: "Terms of Use",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                style: const TextStyle(
                                  color: ConstantColors.mainColor,
                                ),
                              ),
                              const TextSpan(
                                  text:
                                      " and have read and knowledge our global "),
                              TextSpan(
                                text: "Privacy Policy",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                style: const TextStyle(
                                  color: ConstantColors.mainColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        SubBtn(
                          onTap: () {
                            UtilFunction.navigateTo(
                                context, ConfirmMobileNumberScreen());
                          },
                          text: "Sign Up",
                          borderRadius: BorderRadius.circular(60),
                        ),
                        const SizedBox(height: 30),
                        RichText(
                          text: TextSpan(
                            text: "Already have an account? ",
                            style: const TextStyle(
                              color: ConstantColors.mainlyTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: "Login",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    UtilFunction.navigateTo(
                                        context, SignInScreen());
                                  },
                                style: const TextStyle(
                                  color: ConstantColors.mainColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
