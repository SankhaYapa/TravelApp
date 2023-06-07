import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/constant_colors.dart';

class SubBtn extends StatelessWidget {
  const SubBtn({
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
        height: 50,
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
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ConstantColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
