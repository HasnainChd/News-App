import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Component/foryou_loading.dart';
import 'package:newsapp/Component/trending_loading.dart';
import 'package:newsapp/Pages/news_details.dart';
import 'package:newsapp/Widgets/news_foryoucard.dart';
import 'package:newsapp/Widgets/trending_card.dart';
import 'package:newsapp/Controllers/news_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('TODAY NEWS',
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hottest News',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall),
                  ],
                ),
                const SizedBox(height: 10),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                        () =>
                    newsController.trendingLoading.value
                        ? const TrendingLoading()
                        : Row(
                      children: newsController.trendingList.map((e) {
                        return TrendingCard(
                            onTap: () {
                              Get.to(NewsDetails(newsModel: e));
                            },
                            title: e.title,
                            description: '',
                            author: e.author,
                            publishedAt: e.publishedAt.toString(),
                            imageUrl: e.urlToImage);
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text('News ForYou',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineSmall),
                const SizedBox(height: 20),

                Obx(
                      () =>
                  newsController.forYouLoading.value
                      ? const Center(
                      child: ForyouLoading()
                  )
                      : Column(
                    children: newsController.forYouList10.map((e) {
                      return NewsForyoucard(
                        onTap: () {
                          Get.to(NewsDetails(newsModel: e));
                        },
                        title: e.title,
                        author: e.author,
                        publishedAt: e.publishedAt.toString(),
                        imageUrl: e.urlToImage,
                      );
                    }).toList(),
                  ),
                ),
                Text('Tesla News',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineSmall),
                Obx(
                      () =>
                      Column(
                        children: newsController.teslaNewsList10.map((e) {
                          return NewsForyoucard(
                              title: e.title,
                              author: e.author,
                              publishedAt: e.publishedAt.toString(),
                              imageUrl: e.urlToImage,
                              onTap: () {
                                Get.to(NewsDetails(newsModel: e));
                              });
                        }).toList(),
                      ),
                ),
                Text('Apple News',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineSmall),
                Obx(
                  ()=> Column(children:
                    newsController.appleNewsList10.map((e) {
                      return NewsForyoucard(title: e.title,
                          author: e.author,
                          publishedAt: e.publishedAt.toString(),
                          imageUrl: e.urlToImage,
                          onTap: (){
                        Get.to(NewsDetails(newsModel: e));
                          });
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
