import 'package:flutter/material.dart';
import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/paths.dart';

class CustomHederWidget extends StatelessWidget {
  const CustomHederWidget({
    required this.title,
    this.iconprefix,
    this.iconsuffix,
    this.ontap,
    Key? key,
  }) : super(key: key);
  final String title;
  final Icon? iconprefix;
  final Icon? iconsuffix;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 49),
          Container(
            height: 45,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: iconprefix ??
                            Icon(
                              Icons.arrow_back,
                              color: ConstantColors.whiteColor,
                            ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          color: ConstantColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: ontap,
                      icon: iconsuffix ??
                          Image.asset(Paths.iconAssets("light.png"))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
