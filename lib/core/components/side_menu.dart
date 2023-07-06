import 'package:flutter/material.dart';
import 'package:news/view/home/home_view.dart';
import 'package:news/view/settings/settings_view.dart';

import '../utilities/app_color.dart';

class SideMenu extends StatelessWidget {
  bool isCategoryTab;

  SideMenu({required this.isCategoryTab});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              color: AppColor.accentColor,
              child: Text(
                "News App!",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
                color: AppColor.primaryColor,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    InkWell(
                      onTap: () {
                        if (isCategoryTab) {
                          Navigator.pop(context);
                        } else {
                          Navigator.pushReplacementNamed(
                              context, HomeView.routeName);
                        }
                      },
                      child: Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          ImageIcon(
                            const AssetImage("assets/categories_icon.png"),
                            size: 50,
                            color: AppColor.lightBlackColor,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColor.lightBlackColor),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 200),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 200),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    SettingsView(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              final tween = Tween(begin: 0.0, end: 1.0);
                              final fadeAnimation = animation.drive(tween);
                              return FadeTransition(
                                opacity: fadeAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          ImageIcon(
                            const AssetImage("assets/settings_icon.png"),
                            size: 50,
                            color: AppColor.lightBlackColor,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          Text(
                            "Settings",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColor.lightBlackColor),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
