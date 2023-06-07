import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:traveler/router/route_constant.dart';
import 'package:traveler/screens/auth_screens/forgot_password/change_forgot_password_screen.dart';
import 'package:traveler/screens/dashboad_screen/dashboard_screen.dart';
import 'package:traveler/screens/sub_screens/edit_profile_screens/edit_email.dart';
import 'package:traveler/screens/sub_screens/edit_profile_screens/edit_password.dart';
import 'package:traveler/screens/sub_screens/edit_profile_screens/edit_phone_number.dart';
import 'package:traveler/values/paths.dart';
import 'package:traveler/values/util_function.dart';
import 'package:traveler/widgets/sub_btn.dart';

import '../../../values/constant_colors.dart';
import '../../../widgets/common.dart';
import '../../../widgets/main_btn.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: ConstantColors.whiteColor,
                          ),
                        ),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 18,
                            color: ConstantColors.whiteColor,
                          ),
                        )
                      ],
                    ),
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
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // Handle image upload logic
                                        },
                                        child: ClipOval(
                                          child: Container(
                                            width: 142,
                                            height: 142,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                        230, 254, 5, 100)
                                                    .withOpacity(0.2)),
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              Paths.imageAssets("user.png"),
                                              width: 75,
                                              height: 75,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Change Picture",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "First Name",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 20, right: 30),
                                            filled: false,
                                            hintStyle: const TextStyle(
                                              color:
                                                  ConstantColors.hintTextColor,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Color(
                                                    0xFFCCCCCC), // Customize the color of the border
                                                width:
                                                    1.0, // Customize the width of the border
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: ConstantColors
                                                    .mainColor, // Customize the color of the border when focused
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Last Name",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 20, right: 30),
                                            filled: false,
                                            hintStyle: const TextStyle(
                                              color:
                                                  ConstantColors.hintTextColor,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Color(
                                                    0xFFCCCCCC), // Customize the color of the border
                                                width:
                                                    1.0, // Customize the width of the border
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: ConstantColors
                                                    .mainColor, // Customize the color of the border when focused
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 20, right: 30),
                                  filled: false,
                                  hintStyle: const TextStyle(
                                    color: ConstantColors.hintTextColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Color(
                                          0xFFCCCCCC), // Customize the color of the border
                                      width:
                                          1.0, // Customize the width of the border
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: ConstantColors
                                          .mainColor, // Customize the color of the border when focused
                                      width: 1,
                                    ),
                                  ),
                                  suffixIcon: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomeVerifieldIcon(),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            UtilFunction.navigateTo(
                                                context, EditEmailAddress());
                                          });
                                        },
                                        icon: Image.asset(
                                          'assets/icons/edit.png',
                                          width: 18.44,
                                          height: 18.44,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Phone Number",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 20, right: 30),
                                  filled: false,
                                  hintStyle: const TextStyle(
                                    color: ConstantColors.hintTextColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Color(
                                          0xFFCCCCCC), // Customize the color of the border
                                      width:
                                          1.0, // Customize the width of the border
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: ConstantColors
                                          .mainColor, // Customize the color of the border when focused
                                      width: 1,
                                    ),
                                  ),
                                  suffixIcon: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomeUnVerifieldIcon(),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            UtilFunction.navigateTo(context,
                                                EditPhoneNumberScreen());
                                          });
                                        },
                                        icon: Image.asset(
                                          'assets/icons/edit.png',
                                          width: 18.44,
                                          height: 18.44,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 20, right: 30),
                                  filled: false,
                                  hintStyle: const TextStyle(
                                    color: ConstantColors.hintTextColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Color(
                                          0xFFCCCCCC), // Customize the color of the border
                                      width:
                                          1.0, // Customize the width of the border
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: ConstantColors
                                          .mainColor, // Customize the color of the border when focused
                                      width: 1,
                                    ),
                                  ),
                                  suffixIcon: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomeVerifieldIcon(),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            UtilFunction.navigateTo(
                                                context, EditPasswordScreen());
                                          });
                                        },
                                        icon: Image.asset(
                                          'assets/icons/edit.png',
                                          width: 18.44,
                                          height: 18.44,
                                        ),
                                      ),
                                    ],
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
                              left: 20, right: 20, top: 29, bottom: 29),
                          child: SubBtn(
                            onTap: () {
                              UtilFunction.navigateTo(
                                  context, DashboardScreen());
                            },
                            text: "Update",
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

class CustomeVerifieldIcon extends StatelessWidget {
  const CustomeVerifieldIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 58,
      alignment: Alignment.center,
      child: Text(
        "VERIFIED",
        style: TextStyle(
            fontSize: 10, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Color.fromARGB(255, 3, 182, 24),
            Color.fromARGB(255, 57, 179, 4),
            Color.fromARGB(255, 11, 166, 68),
          ],
        ),
      ),
    );
  }
}

class CustomeUnVerifieldIcon extends StatelessWidget {
  const CustomeUnVerifieldIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 72,
      alignment: Alignment.center,
      child: Text(
        "UNVERIFIED",
        style: TextStyle(
            fontSize: 10, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Color(0xFFFF434E), Color(0xFFCC1902)],
        ),
      ),
    );
  }
}
