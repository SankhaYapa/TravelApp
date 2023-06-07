import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:traveler/router/route_constant.dart';
import 'package:traveler/screens/auth_screens/forgot_password/change_forgot_password_screen.dart';
import 'package:traveler/values/util_function.dart';
import 'package:traveler/widgets/sub_btn.dart';

import '../../../values/constant_colors.dart';
import '../../../widgets/gradient_text.dart';
import '../../../widgets/main_btn.dart';

class VerificationForgotPasswordScreen extends StatefulWidget {
  const VerificationForgotPasswordScreen({super.key});

  @override
  State<VerificationForgotPasswordScreen> createState() =>
      _VerificationForgotPasswordScreenState();
}

class _VerificationForgotPasswordScreenState
    extends State<VerificationForgotPasswordScreen> {
  int timerValue = 120;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer timer) {
      if (timerValue == 0) {
        timer.cancel();
      } else {
        setState(() {
          timerValue--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final pinFieldSize = isPortrait ? 70.0 : 50.0;
    final containerSize = isPortrait ? 70.0 : 50.0;
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                ConstantColors.mainColor,
                ConstantColors.mainColor2,
                ConstantColors.mainColor3,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 49),
                Container(
                  height: 45,
                  child: Row(
                    children: [
                      SizedBox(width: 50),
                      Text(
                        "Verification",
                        style: TextStyle(
                          fontSize: 18,
                          color: ConstantColors.whiteColor,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: isPortrait
                      ? MediaQuery.of(context).size.height - 94
                      : 706,
                  decoration: const BoxDecoration(
                    color: ConstantColors.whiteColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              const SizedBox(height: 56),
                              const Text(
                                "Verification code consisting of four digits has been sent to your email. Please check your inbox, as the email might be in your spam or junk folder.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: ConstantColors.black,
                                ),
                              ),
                              const SizedBox(height: 40),
                              Container(
                                width: 272,
                                child: PinCodeTextField(
                                  appContext: context,
                                  length: 4,
                                  obscureText: false,
                                  keyboardType: TextInputType.number,
                                  animationType: AnimationType.none,
                                  blinkWhenObscuring: false,
                                  // controller: textEditingController,
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 63,
                                    fieldWidth: 62,
                                    activeColor: ConstantColors.mainColor,
                                    borderWidth: 2,
                                    selectedColor: ConstantColors.mainColor,
                                    inactiveColor: ConstantColors.mainColor,
                                    activeFillColor: ConstantColors.whiteColor,
                                    inactiveFillColor:
                                        ConstantColors.whiteColor,
                                    selectedFillColor:
                                        ConstantColors.whiteColor,
                                  ),
                                  enableActiveFill: true,
                                  boxShadows: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      blurRadius: 4.0,
                                      spreadRadius: 0.0,
                                      offset: const Offset(
                                        0.0,
                                        4.0,
                                      ),
                                    )
                                  ],
                                  textStyle: const TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.w500,
                                    color: ConstantColors.mainColor,
                                  ),
                                  onCompleted: (v) {
                                    print(v);
                                  },
                                  onChanged: (value) {
                                    print(value);
                                  },
                                  beforeTextPaste: (text) {
                                    print("Allowing to paste $text");
                                    return true;
                                  },
                                ),
                              ),
                              const SizedBox(height: 35),
                              timerValue == 0
                                  ? GradientText(
                                      text: "0",
                                      style: const TextStyle(
                                        fontSize: 50,
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
                                    )
                                  : GradientText(
                                      text: timerValue.toString(),
                                      style: const TextStyle(
                                        fontSize: 50,
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
                              // const GradientText(
                              //   text: "120",
                              //   style: TextStyle(
                              //     fontSize: 50,
                              //   ),
                              //   gradient: LinearGradient(
                              //     begin: Alignment.topRight,
                              //     end: Alignment.bottomLeft,
                              //     colors: [
                              //       ConstantColors.mainColor,
                              //       ConstantColors.mainColor2,
                              //       ConstantColors.mainColor3,
                              //     ],
                              //   ),
                              // ),
                              const Text("Did you not receive the code?"),
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  if (timerValue == 0) {
                                    // Generate and send the new verification code here
                                    startTimer(); // Restart the timer
                                  }
                                },
                                child: const Text(
                                  "Resend Code.",
                                  style: TextStyle(
                                    color: ConstantColors.mainColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                            onTap: () {
                              UtilFunction.navigateTo(
                                  context, ChangeForgotPasswordScreen());
                            },
                            text: "Verify",
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
