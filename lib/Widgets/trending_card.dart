import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final String title;
  final String description;
  final String author;
  final String publishedAt;
  final String imageUrl;
  final VoidCallback onTap;

  const TrendingCard(
      {super.key,
        required this.onTap,
      required this.title,
      required this.description,
      required this.author,
      required this.publishedAt,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        padding: const EdgeInsets.all(5),
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(imageUrl,fit: BoxFit.cover,),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trending News',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  publishedAt,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    child: Text(author[0])),
                const SizedBox(width: 20),
                Flexible(
                  child: Text(
                    author,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
