import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nilcom/features/discover/repository/discover_repository.dart';
import 'package:nilcom/models/user_model.dart';

final discoverControllerProvider = Provider((ref) {
  final discoverRepository = ref.watch(discoverRepositoryProvider);
  return DiscoverController(discoverRepository: discoverRepository);
});

class DiscoverController {
  final DiscoverRepository discoverRepository;

  DiscoverController({required this.discoverRepository});

  Stream<List<UserModel>> getProfilePhotos() {
    return discoverRepository.getProfilePhotos();
  }
}
