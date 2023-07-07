import 'package:flutter/material.dart';

import '../../core/Data/categoryDM.dart';
import '../../core/components/side_menu.dart';
import '../../core/utilities/app_color.dart';
import '../category/category_news_list.dart';
import '../search/search_view.dart';
import 'category_grid_view.dart';

class HomeView extends StatefulWidget {
  static String routeName = "homeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryDM> category = [
    CategoryDM(
        categoryName: "Sports",
        categoryID: "sports",
        imagePath: "assets/sports.png",
        categoryBackgroundColor: AppColor.sportsColor),
    CategoryDM(
        categoryName: "Technology",
        categoryID: "technology",
        imagePath: "assets/technology.png",
        categoryBackgroundColor: AppColor.technologyColor),
    CategoryDM(
        categoryName: "Health",
        categoryID: "health",
        imagePath: "assets/health.png",
        categoryBackgroundColor: AppColor.healthColor),
    CategoryDM(
        categoryName: "Business",
        categoryID: "business",
        imagePath: "assets/business.png",
        categoryBackgroundColor: AppColor.businessColor),
    CategoryDM(
        categoryName: "entertainment",
        categoryID: "entertainment",
        imagePath: "assets/entertainment.png",
        categoryBackgroundColor: AppColor.entertainmentColor),
    CategoryDM(
        categoryName: "Science",
        categoryID: "science",
        imagePath: "assets/science.png",
        categoryBackgroundColor: AppColor.scienceColor),
  ];
  String? selectedCategory;
  String appBarTitle = "News App";
  bool isCategoryTab = true;
  bool searchClicked = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (isCategoryTab) {
          return Future.value(true);
        } else {
          setState(() {
            selectedCategory == null;
            isCategoryTab = true;
            appBarTitle = "News App";
          });
          return Future.value(false);
        }
      },
      child: Scaffold(
          drawer: SideMenu(isCategoryTab: isCategoryTab),
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            backgroundColor: AppColor.accentColor,
            title: Text(
              appBarTitle,
              style: TextStyle(fontSize: 22, color: AppColor.primaryColor),
            ),
            centerTitle: true,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const ImageIcon(
                      AssetImage("assets/home_side_menu_icon.png")),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            actions: isCategoryTab
                ? []
                : [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SearchView.routeName);
                          },
                          icon: Image.asset("assets/search_icon.png")),
                    )
                  ],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            )),
          ),
          body: isCategoryTab
              ? Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/background.png"),
                          fit: BoxFit.cover)),
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Text(
                        "Pick your category of interest",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColor.greyColor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Expanded(
                        child: GridView.builder(
                            padding: const EdgeInsets.all(10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15),
                            itemCount: category.length,
                            itemBuilder: (context, index) => CategoryGridView(
                                  categoryDM: category[index],
                                  index: index,
                                  onClickCategory: onClickCategory,
                                )),
                      ),
                    ],
                  ),
                )
              : CategoryNewsList(categoryID: selectedCategory!)),
    );
  }

  onClickCategory(CategoryDM categoryDM) {
    selectedCategory = categoryDM.categoryID;
    appBarTitle = categoryDM.categoryName;
    isCategoryTab = false;
    setState(() {});
  }
}
