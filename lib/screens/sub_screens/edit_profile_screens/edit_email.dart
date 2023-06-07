import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:traveler/router/route_constant.dart';
import 'package:traveler/screens/auth_screens/sign_up/verify_email_address_screen.dart';
import 'package:traveler/screens/auth_screens/sign_up/verify_phone_number_screen.dart';
import 'package:traveler/values/util_function.dart';
import 'package:traveler/widgets/sub_btn.dart';

import '../../../values/constant_colors.dart';
import '../../../widgets/main_btn.dart';

class EditEmailAddress extends StatefulWidget {
  const EditEmailAddress({super.key});

  @override
  State<EditEmailAddress> createState() => _EditEmailAddressState();
}

class _EditEmailAddressState extends State<EditEmailAddress> {
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
                        "Edit Email Address",
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 40),
                              const Text(
                                "Please enter a new email to change your current email. We will send you the verification code to the new email you provided.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: ConstantColors.mainlyTextColor,
                                    overflow: TextOverflow.clip),
                              ),
                              const SizedBox(height: 100),
                              Text("Email Address"),
                              SizedBox(
                                height: 6,
                              ),
                              TextField(
                                  decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: ConstantColors
                                        .mainColor, // Customize the color of the border when focused
                                    width: 1,
                                  ),
                                ),
                                contentPadding:
                                    const EdgeInsets.only(left: 20, right: 5),
                                filled: false,
                                hintStyle: const TextStyle(
                                  color: ConstantColors.hintTextColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              )),
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
                                  context, VerifyEmailAddressScreen());
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
      }),
    );
  }
}
