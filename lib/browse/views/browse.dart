import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/paths.dart';
import 'package:nilcom/common/sizes.dart';
import 'package:nilcom/features/widgets/appbar_with_title.dart';
import 'package:nilcom/features/widgets/subtitle_widget.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: scaffoldPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarWithTitle(title: 'Browse'),
              const SubtitleWidget(title: 'Most Viewed Articles'),
              Expanded(
                  flex: 2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: right5,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: blueColor,
                              image: const DecorationImage(
                                  image: AssetImage(bookmarkImage),
                                  fit: BoxFit.cover),
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Padding(
                                    padding: all15,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Prepare for your first skateboard jump',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: whiteColor),
                                        ),
                                        Text(
                                          'Berke Kartal',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: whiteColor,
                                          ),
                                        ),
                                        Text(
                                          '125,908 views ',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: whiteColor,
                                          ),
                                        ),
                                        Text(
                                          '2 days ago',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: whiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: all10,
                                    child: AspectRatio(
                                      aspectRatio: 9 / 16,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: blueColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )),
              const SubtitleWidget(title: 'Most Viewed Codes'),
              Expanded(
                  flex: 5,
                  child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
