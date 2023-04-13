import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/models/news.dart';

class NewsFragmentWidget extends StatelessWidget {
  NewsFragmentWidget({
    super.key,
    required this.news,
  });

  News news;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          GoRouter.of(context).pushNamed(
            "news-detail",
            params: {
              "id": news.id.toString(),
            },
            extra: news,
          );
        },
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        leading: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              news.image!,
              fit: BoxFit.cover,
            )),
        title: Text(news.title!),
        subtitle: Text(
          news.content!,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
