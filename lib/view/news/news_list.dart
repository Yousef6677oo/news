import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/view/news/news_item.dart';

import '../../core/Data/ArticlesResponseDM.dart';
import '../../core/Data/sourcesResponseDM.dart';
import '../../core/utilities/app_color.dart';

class NewsList extends StatelessWidget {
  Source source;

  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<ArticlesResponseDM>(
        future: ApiManager.getArticles(source.id ?? ''),
        builder: (buildContext, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.accentColor),
            ));
          }
          if (snapShot.hasError) {
            return Center(
                child: Text("Error loading data ${snapShot.error.toString()}"));
          }
          if (snapShot.data?.status == "error") {
            return Center(
                child: Text("Server error ${snapShot.data?.message}"));
          }
          var newsList = snapShot.data?.articles;
          return ListView.builder(
              itemBuilder: (_, index) {
                return NewsItem(newsList![index]);
              },
              itemCount: newsList?.length ?? 0);
        },
      ),
    );
  }
}
