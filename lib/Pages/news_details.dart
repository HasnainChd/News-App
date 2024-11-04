import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/Controllers/news_controller.dart';
import 'package:newsapp/Model/news_model.dart';

class NewsDetails extends StatelessWidget {
  final NewsModel newsModel;

  const NewsDetails({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400,
                  height: 360,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        newsModel.urlToImage,
                        fit: BoxFit.fill,
                      )),
                ),
                const SizedBox(height: 10),
                Text(
                  newsModel.title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineSmall,
                ),
                const SizedBox(height: 10),
                Text(
                  newsModel.publishedAt.toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                      child: Text(newsModel.author.isNotEmpty
                          ? newsModel.author[0]
                          : 'A'),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        newsModel.author,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primaryContainer,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Obx(
                            () =>
                        controller.isSpeaking.value
                            ? IconButton(
                            onPressed: () {
                              controller.stop();
                            },
                            icon: const Icon(
                              Icons.stop,
                              size: 30,
                            ))
                            : IconButton(
                            onPressed: () {
                              controller.speak(newsModel.description);
                            },
                            icon: const Icon(
                              Icons.play_arrow_rounded,
                              size: 30,
                            )),
                      ),
                      Expanded(
                        child: Obx(
                              () =>
                              Lottie.asset('assets/animation.json',
                                  height: 60,
                                  animate: controller.isSpeaking.value),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  newsModel.description,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
