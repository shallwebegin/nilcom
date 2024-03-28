import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/paths.dart';

class AppBarWithTitle extends StatelessWidget {
  const AppBarWithTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: whiteColor),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(searchSvg),
        ),
      ],
    );
  }
}
