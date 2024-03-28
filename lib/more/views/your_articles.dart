import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/paths.dart';
import 'package:nilcom/common/sizes.dart';
import 'package:nilcom/models/article_model.dart';
import 'package:nilcom/more/controller/more_controller.dart';
import 'package:nilcom/router/router_names.dart';

class YourArticles extends ConsumerWidget {
  const YourArticles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: whiteColor,
            )),
        title: const Text(
          'Your Article',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: scaffoldPadding,
        child: StreamBuilder<List<ArticleModel>>(
            stream: ref.watch(moreControllerProvider).getArticles(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final articles = snapshot.data!;

                return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, AppRouteNames.article,
                          arguments: ({'article': article})),
                      child: Padding(
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
                                      image: CachedNetworkImageProvider(
                                          article.coverImg!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: horizontal10,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      article.title,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: whiteColor,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                    ),
                                    Text(
                                      article.content,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: greyColor,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      '${article.views} views * ${DateFormat("dd.MM.y").format(article.createdAt)}',
                                      style: const TextStyle(
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
                      ),
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text('Error'),
                );
              }
            }),
      ),
    );
  }
}
