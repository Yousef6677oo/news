import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';

import '../../core/Data/sourcesResponseDM.dart';
import '../../core/utilities/app_color.dart';
import 'category_tabs_widget.dart';

class CategoryNewsList extends StatelessWidget {
  String categoryID;

  CategoryNewsList({required this.categoryID});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
      child: FutureBuilder<SourcesResponseDM>(
        future: ApiManager.getSources(categoryID),
        builder: (context, snapShot) {
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
          var sources = snapShot.data?.sources;
          return CategoryTabsWidget(sources!);
        },
      ),
    );
  }
}
