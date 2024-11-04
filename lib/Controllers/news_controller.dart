import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/Model/news_model.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trendingList = <NewsModel>[].obs;

  RxList<NewsModel> forYouList = <NewsModel>[].obs;
  RxList<NewsModel> forYouList10 = <NewsModel>[].obs;

  RxList<NewsModel> businessList = <NewsModel>[].obs;
  RxList<NewsModel> businessList10 = <NewsModel>[].obs;

  RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> teslaNewsList10 = <NewsModel>[].obs;

  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList10 = <NewsModel>[].obs;

  FlutterTts flutterTts = FlutterTts();

  RxBool trendingLoading = false.obs;
  RxBool forYouLoading = false.obs;
  RxBool teslaLoading = false.obs;
  RxBool appleLoading = false.obs;
  RxBool isSpeaking = false.obs;

  @override
  void onInit() {
    getTrendingNews();
    getForYouNews();
    getTeslaNews();
    getAppleNews();
    super.onInit();
  }

  Future<void> getTrendingNews() async {
    trendingLoading(true);
    try {
      var url =
          'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=88674f8ae3d7421d86a55854fe68824d';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print(response);
        var body = jsonDecode(response.body);
        var articles = body['articles'];
        for (var news in articles) {
          trendingList.add(NewsModel.fromJson(news));
        }
      }
      print(response);
    } catch (e) {
      print(e.toString());
    }
    trendingLoading(false);
  }

  Future<void> getForYouNews() async {
    forYouLoading(true);
    try {
      var url =
          'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=88674f8ae3d7421d86a55854fe68824d';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body['articles'];
        for (var news in articles) {
          forYouList.add(NewsModel.fromJson(news));
        }
        forYouList10.value = forYouList.sublist(0, 10);
      }
    } catch (e) {
      print(e.toString());
    }
    forYouLoading(false);
  }

  Future<void> getTeslaNews() async {
    teslaLoading(true);
    try {
      var url =
          'https://newsapi.org/v2/everything?q=tesla&from=2024-10-04&sortBy=publishedAt&apiKey=88674f8ae3d7421d86a55854fe68824d';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body['articles'];
        for (var news in articles) {
          teslaNewsList.add(NewsModel.fromJson(news));
        }
        teslaNewsList10.value = teslaNewsList.sublist(0, 10);
      }
    } catch (e) {
      print(e.toString());
    }
    teslaLoading(false);
  }

  Future<void> getAppleNews() async {
    appleLoading(true);
    try {
      var url =
          'https://newsapi.org/v2/everything?q=apple&from=2024-11-01&to=2024-11-01&sortBy=popularity&apiKey=88674f8ae3d7421d86a55854fe68824d';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body['articles'];
        for (var news in articles) {
          appleNewsList.add(NewsModel.fromJson(news));
        }
        appleNewsList10.value = appleNewsList.sublist(0, 10);
      }
    } catch (e) {
      print(e.toString());
    }
    appleLoading(false);
  }

  Future<void> searchNews(String search) async {
    forYouLoading(true);
    try {
      var url =
          'https://newsapi.org/v2/everything?q=$search&apiKey=88674f8ae3d7421d86a55854fe68824d';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body['articles'];
        forYouList.clear();
        int i = 0;
        for (var news in articles) {
          i++;
          forYouList.add(NewsModel.fromJson(news));
          if (i == 10) {
            break;
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
    forYouLoading(false);
  }

  Future<void> speak(String text) async {
    isSpeaking(true);
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.3);
    await flutterTts.setPitch(.9);
    await flutterTts.speak(text);

    isSpeaking(false);
  }
  void stop()async{
    await flutterTts.stop();
    isSpeaking(false);
  }
}
