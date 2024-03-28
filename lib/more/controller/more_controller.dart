import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nilcom/models/article_model.dart';
import 'package:nilcom/models/user_model.dart';
import 'package:nilcom/more/repository/more_repository.dart';

final moreControllerProvider = Provider((ref) {
  final moreRepository = ref.watch(moreRepositoryProvider);
  return MoreController(moreRepository: moreRepository, ref: ref);
});

class MoreController {
  final MoreRepository moreRepository;
  final ProviderRef ref;

  MoreController({required this.moreRepository, required this.ref});

  Future<void> signOut() async {
    return moreRepository.signOut();
  }

  Future<void> writeArticle(ArticleModel model) async {
    await moreRepository.writeArticle(model);
  }

  Stream<List<ArticleModel>> getArticles() {
    return moreRepository.getArticles();
  }

  Future<UserModel> getUser() async {
    return await moreRepository.getUser();
  }

  Future<void> updateProfile(UserModel model) async {
    await moreRepository.updateProfile(model);
    ref.refresh(moreControllerProvider).getUser();
  }
}
