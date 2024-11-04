import 'package:flutter/material.dart';
import 'package:newsapp/Controllers/news_controller.dart';
import 'package:get/get.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    NewsController controller = Get.put(NewsController());

    return Container(
      padding: const EdgeInsets.only(left: 10,right: 5),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: 'Search News'),
          )),
          Obx(
            () => controller.forYouLoading.value
                ? Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ))
                : InkWell(
                    onTap: () {
                      controller.searchNews(searchController.text);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primary),
                      child: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
