import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Data/articlesResponseDM.dart';
import '../Data/sourcesResponseDM.dart';

class ApiManager {
  static String baseUrl = "newsapi.org";

  /// static String apiKey = "4d20c53ffe7b4e08b6b2c905f294c222";
  static String apiKey = "4ad9fd69706146a99b31a2019eeedbb0";

  static Future<SourcesResponseDM> getSources(String category) async {
    Uri url = Uri.https(baseUrl, "v2/top-headlines/sources",
        {"apiKey": apiKey, "category": category});
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body) as Map;
    SourcesResponseDM responseDM = SourcesResponseDM.fromJson(json);
    return responseDM;
  }

  static Future<ArticlesResponseDM> getArticles(String? sourceID) async {
    Uri url = Uri.https(
        baseUrl, "v2/everything", {"apiKey": apiKey, "sources": sourceID});
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body) as Map;
    ArticlesResponseDM responseDM = ArticlesResponseDM.fromJson(json);
    return responseDM;
  }
}
