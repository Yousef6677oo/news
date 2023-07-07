import 'package:flutter/material.dart';

import '../../core/utilities/app_color.dart';

class SearchView extends StatefulWidget {
  static String routeName = "searchScreen";

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();
  List<String> testList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: AppColor.accentColor,
          title: Container(
            width: double.infinity,
            height: 42,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: buildSearchTextField(),
            ),
          ),
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          )),
        ),
        body: testList.isEmpty
            ? buildNotFoundNews()
            : ListView.builder(
                itemCount: testList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    height: 200,
                    color: Colors.lightGreenAccent,
                    child: Text(testList[index]),
                  );
                }));
  }

  Widget buildSearchTextField() {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                searchController.clear();
              });
            },
          ),
          prefixIconColor: const Color(0xff39A552),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              //todo: will call api to search from this icon
            },
          ),
          suffixIconColor: const Color(0xff39A552),
          hintText: 'Search Article',
          hintStyle: const TextStyle(color: Color(0x8039a552)),
          border: InputBorder.none),
    );
  }

  Widget buildNotFoundNews() {
    return searchController.text == ""
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 4,
              ),
              Image.asset("assets/news_icon_not_found.png",
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: MediaQuery.of(context).size.width * 0.22),
              const SizedBox(
                height: 10,
              ),
              const Text("No news found",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color(0x8039a552)),
                  textAlign: TextAlign.center),
              const Spacer(
                flex: 6,
              )
            ],
          );
  }
}
