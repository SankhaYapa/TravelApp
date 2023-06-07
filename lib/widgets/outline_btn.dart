import 'package:flutter/material.dart';
import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/widgets/gradient_text.dart';

class OutlineBtn extends StatelessWidget {
  const OutlineBtn({
    super.key,
    required this.onTap,
    required this.text,
  });

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 19),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: ConstantColors.transparent,
          border: Border.all(
            width: 1,
            color: ConstantColors.mainColor,
          ),
        ),
        child: Center(
          child: GradientText(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                ConstantColors.mainColor,
                ConstantColors.mainColor2,
                ConstantColors.mainColor3,
              ],
            ),
            text: text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: ConstantColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
