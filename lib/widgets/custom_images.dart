import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../values/paths.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg(
      {Key? key,
      required this.svgName,
      this.color,
      this.height,
      this.width,
      this.gradient})
      : super(key: key);
  final String svgName;
  final Color? color;
  final int? width;
  final int? height;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Paths.iconAssets('$svgName.svg'),
      color: color,
    );
  }
}
