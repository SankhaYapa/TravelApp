import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:traveler/router/route_constant.dart';
import 'package:traveler/screens/auth_screens/sign_up/verify_phone_number_screen.dart';
import 'package:traveler/values/util_function.dart';
import 'package:traveler/widgets/sub_btn.dart';

import '../../../values/constant_colors.dart';
import '../../../widgets/main_btn.dart';

class ConfirmMobileNumberScreen extends StatefulWidget {
  const ConfirmMobileNumberScreen({super.key});

  @override
  State<ConfirmMobileNumberScreen> createState() =>
      _ConfirmMobileNumberScreenState();
}

class _ConfirmMobileNumberScreenState extends State<ConfirmMobileNumberScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final pinFieldSize = isPortrait ? 70.0 : 50.0;
    final containerSize = isPortrait ? 70.0 : 50.0;
    return Scaffold(body: OrientationBuilder(builder: (context, orientation) {
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
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: ConstantColors.whiteColor,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "Confirm Mobile Number",
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
                height:
                    isPortrait ? MediaQuery.of(context).size.height - 94 : 706,
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
                            const SizedBox(height: 40),
                            const Text(
                              "Are you sure that the following mobile number is correct? The verification code will be sent to it.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: ConstantColors.mainlyTextColor,
                                  overflow: TextOverflow.clip),
                            ),
                            const SizedBox(height: 100),
                            RichText(
                              text: const TextSpan(
                                text: "Mobile Number   ",
                                style: TextStyle(
                                  color: ConstantColors.mainColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: "+92 3480984422",
                                    style: TextStyle(
                                      color: ConstantColors.mainlyTextColor,
                                    ),
                                  ),
                                ],
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
                            left: 20, right: 20, top: 29, bottom: 29),
                        child: SubBtn(
                          onTap: () {
                            UtilFunction.navigateTo(
                                context, VerifyPhoneNumberScreen());
                          },
                          text: "Get a code",
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
    }));
  }
}
