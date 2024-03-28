import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nilcom/models/article_model.dart';
import 'package:nilcom/more/repository/more_repository.dart';

final moreControllerProvider = Provider((ref) {
  final moreRepository = ref.watch(moreRepositoryProvider);
  return MoreController(moreRepository: moreRepository);
});

class MoreController {
  final MoreRepository moreRepository;

  MoreController({required this.moreRepository});

  Future<void> signOut() async {
    return moreRepository.signOut();
  }

  Future<void> writeArticle(ArticleModel model) async {
    await moreRepository.writeArticle(model);
  }
}
