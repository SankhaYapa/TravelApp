import 'package:flutter/material.dart';
import 'package:traveler/values/constant_colors.dart';

class MiniBtn extends StatelessWidget {
  const MiniBtn({super.key, required this.onTap, required this.text});

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: const Offset(
                0.0,
                5.0,
              ),
            )
          ],
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
              color: ConstantColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
