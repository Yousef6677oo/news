import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/Data/articleDM.dart';
import '../../core/components/side_menu.dart';
import '../../core/utilities/app_color.dart';

class ArticleView extends StatefulWidget {
  static String routeName = "articleView";

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ArticleDM;
    return Scaffold(
      drawer: SideMenu(isCategoryTab: false),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: AppColor.accentColor,
        title: Text(
          "News Title",
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
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Stack(alignment: Alignment.center, children: [
                  CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColor.accentColor),
                  ),
                  Image.network(
                    args.articleImagePath,
                    width: double.infinity,
                    height: 200,
                  ),
                ])),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(args.articleAuthor,
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xff79828B))),
                    const SizedBox(height: 4),
                    Text(args.articleTitle,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 6),
                    const Text(
                      "3 hours ago",
                      style: TextStyle(fontSize: 13, color: Color(0xffA3A3A3)),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      args.articleBody,
                      style: const TextStyle(
                          fontSize: 15, color: Color(0xff42505C)),
                    ),
                    const SizedBox(height: 25),
                    InkWell(
                      onTap: () {
                        print(args.urlFullArticle);
                      },
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Text(
                              "View Full Article",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            onPressed: () async{
                              //var url = Uri.parse(args.urlFullArticle);
                              var url = Uri.http(args.urlFullArticle);
                              if(await canLaunchUrl(url)){
                                await launchUrl(url);
                              }
                            },
                          ),
                          Icon(Icons.arrow_right_outlined)
                        ],
                      ),
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
  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
