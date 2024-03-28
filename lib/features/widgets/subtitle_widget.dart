import 'package:flutter/material.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/sizes.dart';

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: vertical10,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: whiteColor),
      ),
    );
  }
}
