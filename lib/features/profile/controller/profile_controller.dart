import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nilcom/features/profile/repository/profile_repository.dart';
import 'package:nilcom/models/user_model.dart';

final profileControllerProvider = Provider(
  (ref) => ProfileController(
    profileRepository: ref.read(profileRepositoryProvider),
  ),
);

class ProfileController {
  final ProfileRepository profileRepository;

  ProfileController({required this.profileRepository});
  Future<UserModel> getUser() async {
    return await profileRepository.getUser();
  }
}
