import 'package:flutter/material.dart';

import '../../core/components/side_menu.dart';
import '../../core/utilities/app_color.dart';

class SettingsView extends StatefulWidget {
  static String routeName = "settingsScreen";

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(
        isCategoryTab: false,
      ),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: AppColor.accentColor,
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 22, color: AppColor.primaryColor),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon:
                  const ImageIcon(AssetImage("assets/home_side_menu_icon.png")),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        )),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Language",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColor.lightBlackColor),
              ),
            ),
            InkWell(
              onTap: () {
                showMyBottomSheet();
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                    vertical: MediaQuery.of(context).size.height * 0.02),
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff39A552))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "English",
                      style: TextStyle(fontSize: 14, color: Color(0xff39A552)),
                    ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Color(0xff39A552),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future showMyBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "selected language",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: AppColor.lightBlackColor),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "English",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColor.accentColor),
                  ),
                  const SizedBox(height: 10),
                  Text("عربي",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColor.lightBlackColor,
                      ))
                ],
              ),
            ));
  }
}
