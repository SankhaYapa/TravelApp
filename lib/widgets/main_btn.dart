import 'package:flutter/material.dart';

import '../values/constant_colors.dart';

class MainBtn extends StatelessWidget {
  const MainBtn({
    super.key,
    required this.onTap,
    required this.text,
    required this.borderRadius,
  });

  final Function onTap;
  final String text;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              ConstantColors.mainColor,
              ConstantColors.mainColor2,
              ConstantColors.mainColor3,
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
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
