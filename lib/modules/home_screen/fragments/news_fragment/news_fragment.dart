import 'package:flutter/material.dart';
import '../../../../models/news.dart';
import '../news_fragment/news_fragment_widget.dart';

class NewsFragment extends StatelessWidget {
  const NewsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const ListTile(
            title: Text("News Article",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
        Column(
            children: newsList
                .map((News news) => NewsFragmentWidget(news: news))
                .toList())
      ],
    );
  }
}