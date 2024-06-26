// ignore_for_file: sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/paths.dart';
import 'package:nilcom/common/sizes.dart';
import 'package:nilcom/features/auth/views/sign_in.dart';
import 'package:nilcom/features/widgets/subtitle_widget.dart';
import 'package:nilcom/models/user_model.dart';
import 'package:nilcom/more/controller/more_controller.dart';
import 'package:nilcom/router/router_names.dart';

class More extends ConsumerWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder<UserModel>(
          future: ref.read(moreControllerProvider).getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userModel = snapshot.data!;
              return SafeArea(
                child: Padding(
                  padding: scaffoldPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          Padding(
                            padding: vertical10,
                            child: CircleAvatar(
                              backgroundColor: profilePhotoCircleColor,
                              radius: 20,
                              backgroundImage: CachedNetworkImageProvider(
                                  userModel.profilePhoto!),
                            ),
                          ),
                        ],
                      ),
                      const SubtitleWidget(title: 'Create content'),
                      _MenuItem(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              AppRouteNames.writeArticle,
                              arguments: {'currentUser': userModel});
                        },
                        title: 'Write an article',
                        leadingAsset: articleSvg,
                      ),
                      _MenuItem(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRouteNames.yourArticles,
                          );
                        },
                        title: 'Your articles',
                        leadingAsset: articleSvg,
                      ),
                      const SubtitleWidget(title: 'Profile'),
                      _MenuItem(
                        title: 'Edit profile',
                        leadingAsset: editProfile,
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              AppRouteNames.editProfile,
                              arguments: {'currentUser': userModel});
                        },
                      ),
                      _MenuItem(
                        onTap: () {
                          ref
                              .read(moreControllerProvider)
                              .signOut()
                              .whenComplete(() => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignIn(),
                                  ),
                                  (route) => false));
                        },
                        title: 'Sign out',
                        leadingAsset: signOutSvg,
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          }),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    super.key,
    this.onTap,
    required this.title,
    required this.leadingAsset,
  });
  final void Function()? onTap;
  final String title;
  final String leadingAsset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: vertical5,
        child: Card(
          child: ListTile(
            leading: SvgPicture.asset(leadingAsset),
            title: Text(
              title,
              style: const TextStyle(color: whiteColor, fontSize: 14),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: whiteColor,
            ),
          ),
          color: activeColor,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
