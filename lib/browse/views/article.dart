import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/paths.dart';
import 'package:nilcom/common/sizes.dart';
import 'package:nilcom/models/article_model.dart';

class Article extends StatelessWidget {
  const Article({super.key, required this.article});
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: whiteColor,
              )),
          title: Text(
            article.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: whiteColor),
          ),
          actions: [
            CircleAvatar(
              backgroundColor: activeColor,
              child: SvgPicture.asset(
                bookmarkDeActiveSvg,
                colorFilter:
                    const ColorFilter.mode(whiteColor, BlendMode.srcIn),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: scaffoldPadding,
          child: Column(
            children: [
              Padding(
                padding: vertical10,
                child: GestureDetector(
                  onTap: () {},
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      decoration: BoxDecoration(
                        color: activeColor,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image:
                                CachedNetworkImageProvider(article.coverImg!),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          article.title,
                          style: const TextStyle(
                              fontSize: 20,
                              color: whiteColor,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          article.content,
                          style:
                              const TextStyle(fontSize: 17, color: whiteColor),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
