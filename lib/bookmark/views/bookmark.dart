import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/paths.dart';
import 'package:nilcom/common/sizes.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: scaffoldPadding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'More',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: whiteColor),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(searchSvg),
                  ),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(bookmarkImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 5,
                          child: Padding(
                            padding: horizontal10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'For My Project Need  ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: whiteColor,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                ),
                                Text(
                                  'Berke Kartal',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: greyColor,
                                  ),
                                ),
                                Text(
                                  '125,908 views * 2 days ago',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: greyColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: horizontal10,
                            child: CircleAvatar(
                              backgroundColor: activeColor,
                              child: SvgPicture.asset(
                                bookmarkDeActiveSvg,
                                colorFilter: const ColorFilter.mode(
                                    whiteColor, BlendMode.srcIn),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
