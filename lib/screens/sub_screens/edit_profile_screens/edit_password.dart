import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:traveler/router/route_constant.dart';
import 'package:traveler/screens/auth_screens/sign_in/sign_in_screen.dart';
import 'package:traveler/values/util_function.dart';
import 'package:traveler/widgets/sub_btn.dart';

import '../../../values/constant_colors.dart';
import '../../../widgets/common.dart';
import '../../../widgets/main_btn.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  bool _isObscureConfirmPassword = true;
  bool _isObscureNewPassword = true;
  bool _isObscurePassword = true;
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    var common = Provider.of<Common>(context, listen: false);
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
                      Text(
                        "Change Password",
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 56),
                                  const Text(
                                    "Please note that your password must be at least 8 characters long, consisting of both letters and numbers, to enhance the security of your account.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: ConstantColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 41),
                                  Text("Current password"),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: TextField(
                                      obscureText: _isObscurePassword,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 8),
                                        isDense: true,
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Colors
                                                .grey, // Customize the color of the border
                                            width:
                                                1.0, // Customize the width of the border
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                            color: ConstantColors
                                                .mainColor, // Customize the color of the border when focused
                                            width: 1,
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _isObscurePassword =
                                                  !_isObscurePassword;
                                            });
                                          },
                                          icon: Image.asset(
                                            _isObscurePassword
                                                ? 'assets/icons/eye.png'
                                                : 'assets/icons/hideeye.png',
                                            width: _isObscurePassword ? 20 : 22,
                                            height:
                                                _isObscurePassword ? 20 : 22,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text("New password"),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: TextField(
                                      obscureText: _isObscureNewPassword,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 8),
                                        isDense: true,
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Colors
                                                .grey, // Customize the color of the border
                                            width:
                                                1.0, // Customize the width of the border
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                            color: ConstantColors
                                                .mainColor, // Customize the color of the border when focused
                                            width: 1,
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _isObscureNewPassword =
                                                  !_isObscureNewPassword;
                                            });
                                          },
                                          icon: Image.asset(
                                            _isObscureNewPassword
                                                ? 'assets/icons/eye.png'
                                                : 'assets/icons/hideeye.png',
                                            width:
                                                _isObscureNewPassword ? 20 : 22,
                                            height:
                                                _isObscureNewPassword ? 20 : 22,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text("Confirm new password"),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: TextField(
                                      obscureText: _isObscureConfirmPassword,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 8),
                                        isDense: true,
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Colors
                                                .grey, // Customize the color of the border
                                            width:
                                                1.0, // Customize the width of the border
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                            color: ConstantColors
                                                .mainColor, // Customize the color of the border when focused
                                            width: 1,
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _isObscureConfirmPassword =
                                                  !_isObscureConfirmPassword;
                                            });
                                          },
                                          icon: Image.asset(
                                            _isObscureConfirmPassword
                                                ? 'assets/icons/eye.png'
                                                : 'assets/icons/hideeye.png',
                                            width: _isObscureConfirmPassword
                                                ? 20
                                                : 22,
                                            height: _isObscureConfirmPassword
                                                ? 20
                                                : 22,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                              UtilFunction.navigateTo(context, SignInScreen());
                            },
                            text: "Confirm Changes",
                            borderRadius: BorderRadius.circular(10),
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
