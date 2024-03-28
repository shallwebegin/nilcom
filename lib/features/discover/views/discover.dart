import 'package:flutter/material.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/paths.dart';
import 'package:nilcom/common/sizes.dart';
import 'package:nilcom/features/widgets/appbar_with_title.dart';
import 'package:nilcom/features/widgets/content_listview.dart';
import 'package:nilcom/features/widgets/subtitle_widget.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: scaffoldPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarWithTitle(title: 'Discover'),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: horizontal5,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(profileImage),
                          ),
                          Padding(
                            padding: top10,
                            child: Text(
                              'Budi',
                              style: TextStyle(color: greyColor, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SubtitleWidget(title: 'Most Viewed Articles'),
              const Expanded(
                flex: 2,
                child: ContentListView(),
              ),
              const SubtitleWidget(title: 'Most Viewed Codes'),
              const Expanded(
                flex: 2,
                child: ContentListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
