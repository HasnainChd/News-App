import 'package:flutter/material.dart';

class NewsForyoucard extends StatelessWidget {
  final String title;
  final String author;
  final String publishedAt;
  final String imageUrl;
  final VoidCallback onTap;

  const NewsForyoucard({
    super.key,
    required this.title,
    required this.author,
    required this.publishedAt,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Row(
          children: [
            Container(
              height: 180,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.secondary),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl.isNotEmpty ? imageUrl : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu_EAM7505RBdxy-XjgRcwczQoBViPPCiBOy52zlPlPuKVzjffdRrPvUkFETSXMBwXyW4&usqp=CAU',
                    fit: BoxFit.fill,
                  )),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 20,
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          child: Text(author.isNotEmpty ? author[0] : 'A')),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                            maxLines: 2,
                            author.isNotEmpty? author: 'Unknown Author',
                            style: Theme.of(context).textTheme.bodyLarge),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    publishedAt,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
