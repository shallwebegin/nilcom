import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/sizes.dart';
import 'package:nilcom/features/discover/controller/discover_controller.dart';
import 'package:nilcom/features/widgets/appbar_with_title.dart';
import 'package:nilcom/features/widgets/content_listview.dart';
import 'package:nilcom/features/widgets/subtitle_widget.dart';
import 'package:nilcom/models/user_model.dart';

class Discover extends ConsumerWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                child: StreamBuilder<List<UserModel>>(
                    stream: ref
                        .watch(discoverControllerProvider)
                        .getProfilePhotos(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<UserModel> user = snapshot.data!;

                        return ListView.builder(
                          itemCount: user.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final users = user[index];

                            return Padding(
                              padding: horizontal5,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        NetworkImage(users.profilePhoto!),
                                  ),
                                  Padding(
                                    padding: top10,
                                    child: Text(
                                      users.name,
                                      style: TextStyle(
                                          color: greyColor, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text('Error'),
                        );
                      } else {
                        return const Center(
                          child: Text('Error'),
                        );
                      }
                    }),
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
