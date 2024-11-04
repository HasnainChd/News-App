import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Component/foryou_loading.dart';
import 'package:newsapp/Pages/news_details.dart';
import 'package:newsapp/Widgets/news_foryoucard.dart';
import 'package:newsapp/Controllers/news_controller.dart';
import 'package:newsapp/Widgets/search_widget.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SearchWidget(),
                  Obx(
                    () => newsController.forYouLoading.value
                        ? const ForyouLoading()
                        : Column(
                            children: newsController.forYouList.map((e) {
                            return NewsForyoucard(
                              onTap: () {
                                Get.to(NewsDetails(newsModel: e));
                              },
                              title: e.title,
                              author: e.author,
                              publishedAt: e.publishedAt.toString(),
                              imageUrl: e.urlToImage,
                            );
                          }).toList()),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
