import 'package:flutter/material.dart';
import 'package:news/core/Data/articlesResponseDM.dart';
import 'package:news/core/utilities/app_color.dart';

import '../../core/Data/articleDM.dart';
import '../article/article_view.dart';

class NewsItem extends StatelessWidget {
  Article article;

  NewsItem(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ArticleView.routeName,
              arguments: ArticleDM(
                  articleImagePath: article.urlToImage ??
                      'https://firehouseshelter.com/wp-content/themes/kronos/assets/images/news-placeholder.jpg',
                  articleAuthor: article.author ?? '',
                  articleTitle: article.title ?? '',
                  articleBody: article.content ?? '',
                  urlFullArticle: article.url ?? '',
                  articlePublishedAt: article.publishedAt ?? ''));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(alignment: Alignment.center, children: [
                  CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColor.accentColor),
                  ),
                  Image.network(
                    article.urlToImage ??
                        'https://firehouseshelter.com/wp-content/themes/kronos/assets/images/news-placeholder.jpg',
                    width: double.infinity,
                    height: 200,
                  ),
                ])),
            const SizedBox(height: 2),
            Text(
              article.author ?? '',
              style: const TextStyle(fontSize: 15, color: Color(0xff79828B)),
            ),
            const SizedBox(height: 4),
            Text(article.title ?? '',
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff42505C))),
            const SizedBox(height: 2),
            Text(article.publishedAt ?? '', textAlign: TextAlign.end),
          ],
        ),
      ),
    );
  }
}
