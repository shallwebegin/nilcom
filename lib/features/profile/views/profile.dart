import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/sizes.dart';
import 'package:nilcom/features/profile/controller/profile_controller.dart';
import 'package:nilcom/models/user_model.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: scaffoldPadding,
          child: FutureBuilder<UserModel>(
              future: ref.read(profileControllerProvider).getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final userModel = snapshot.data!;

                  return Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: vertical10,
                          child: CircleAvatar(
                            backgroundColor: profilePhotoCircleColor,
                            radius: 50,
                            child: CircleAvatar(
                              backgroundColor: profilePhotoCircleColor,
                              radius: 48,
                              backgroundImage: CachedNetworkImageProvider(
                                  userModel.profilePhoto!),
                            ),
                          ),
                        ),
                        Padding(
                          padding: vertical10,
                          child: Text(
                            '@${userModel.userName}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: vertical10,
                          child: Text(
                            '${userModel.name}  ${userModel.surname}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        MaterialButton(
                          color: profilePhotoCircleColor,
                          onPressed: () {},
                          elevation: 0,
                          minWidth: 200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Padding(
                            padding: vertical10,
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(color: containerColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
              }),
        ),
      ),
    );
  }
}
