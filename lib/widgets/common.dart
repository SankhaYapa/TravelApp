import 'dart:io';
import 'package:flutter/material.dart';
import 'package:traveler/values/constant_colors.dart';

class Common extends ChangeNotifier {
  InputDecoration inputDecoration({
    required String hintText,
    Widget? suffix,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(left: 20, right: 30),
      filled: true,
      fillColor: ConstantColors.lightGreyColor,
      hintText: hintText,
      suffixIcon: suffix,
      hintStyle: const TextStyle(
        color: ConstantColors.hintTextColor,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Widget bottomNavigationSelectedItem({
    required BuildContext context,
    required Function onTap,
    required int index,
    required int selectedIndex,
    required String icon,
    required String iconWhite,
    required String text,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 6,
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (selectedIndex == index)
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ConstantColors.whiteColor,
                    width: 4,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      ConstantColors.mainColor,
                      ConstantColors.mainColor2,
                      ConstantColors.mainColor3,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  margin: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ConstantColors.whiteColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Image.asset(
                      iconWhite,
                      width: 25,
                      height: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (selectedIndex != index)
              Image.asset(
                icon,
                width: 25,
                height: 25,
              ),
            if (Platform.isAndroid) const SizedBox(height: 10),
            if (Platform.isIOS)
              Column(
                children: [
                  const SizedBox(height: 2),
                  Text(
                    text,
                    style: const TextStyle(
                      color: ConstantColors.darkGreyColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
