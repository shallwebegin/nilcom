import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nilcom/browse/controller/browse_controller.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/sizes.dart';
import 'package:nilcom/models/article_model.dart';
import 'package:nilcom/router/router_names.dart';

class ContentListView extends ConsumerWidget {
  const ContentListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<List<ArticleModel>>(
        stream: ref.watch(browseControllerProvider).getArticles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            List<ArticleModel> articles = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, AppRouteNames.article,
                      arguments: ({'article': article})),
                  child: Padding(
                    padding: right5,
                    child: AspectRatio(
                      aspectRatio: 14 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: blueColor,
                          image: DecorationImage(
                              image:
                                  CachedNetworkImageProvider(article.coverImg!),
                              fit: BoxFit.cover),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: all15,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '${article.title}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: whiteColor),
                                    ),
                                    Text(
                                      '${article.author}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: whiteColor,
                                      ),
                                    ),
                                    Text(
                                      '${article.views.toString()} views',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: whiteColor,
                                      ),
                                    ),
                                    Text(
                                      DateFormat("dd.MM.y")
                                          .format(article.createdAt),
                                      style: const TextStyle(
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
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              article.authorImg!),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
        });
  }
}
