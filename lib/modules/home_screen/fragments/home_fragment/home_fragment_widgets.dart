import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/configs/app_routes.dart';
import 'package:pertemuan_v/modules/home_screen/fragments/news_fragment/news_fragment.dart';

import '../../../../models/news.dart';
import '../../../../models/user.dart';
import '../news_fragment/news_fragment_widget.dart';

class HomeFragmentWidget {
  static header({
    required User user,
    required GlobalKey<ScaffoldState> homeScaffoldState,
  }) {
    return HeaderWidget(
      user: user,
      homeScaffoldState: homeScaffoldState,
    );
  }

  static searchField() {
    return const SearchFieldWidget();
  }

  // static sectionTitle(String label) {
  //   return SectionTitle(label: label);
  // }

  static hotestNewsCard() {
    return const HotNewsWidget();
  }

  static latestNewsSection() {
    return const LatestNewsSection();
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.user,
    required this.homeScaffoldState,
  });

  final User user;
  final GlobalKey<ScaffoldState> homeScaffoldState;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hi, Welcome"),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            homeScaffoldState.currentState!.openEndDrawer();
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              user.profilePhoto!,
            ),
          ),
        ),
      ],
    );
  }
}

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        isDense: true,
        hintText: "Search",
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        suffixIcon: const Icon(
          Icons.search_rounded,
          color: Colors.red,
        ),
      ),
    );
  }
}

class HotNewsWidget extends StatefulWidget {
  const HotNewsWidget({
    super.key,
  });

  @override
  State<HotNewsWidget> createState() => _HotNewsWidgetState();
}

class _HotNewsWidgetState extends State<HotNewsWidget> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Hot News"),
          trailing: IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.red,
                    title: const Text("News"),
                  ),
                  body: const NewsFragment(),
                );
              }));
            },
          ),
        ),
        SizedBox(
          height: 200,
          child: PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            children: hotNewsList
                .map((News news) => HotNewsCard(news: news))
                .toList(),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
            (index) => DotWidget(_pageIndex, index),
          ),
        )
      ],
    );
  }
}

class DotWidget extends StatelessWidget {
  int index;
  int itemIndex;
  DotWidget(
    this.index,
    this.itemIndex, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        radius: 5,
        backgroundColor: itemIndex == index ? Colors.black : Colors.grey,
      ),
    );
  }
}

class HotNewsCard extends StatelessWidget {
  News news;
  HotNewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).pushNamed(
          'news-detail',
          params: {
            'id': news.id.toString(),
          },
          extra: news,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              news.image!,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.grey])),
            child: ListTile(
              title: Text(
                news.title!,
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              // subtitle: Text(
              //   news.content!,
              //   maxLines: 2,
              //   overflow: TextOverflow.ellipsis,
              //   style: const TextStyle(
              //     color: Colors.white,
              //   ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}

class LatestNewsSection extends StatelessWidget {
  const LatestNewsSection({
    super.key,
  });

  Future<List<News>> getdataNews() async {
    List<News> newslistData = [];
    await Future.delayed(const Duration(seconds: 1), () {
      newslistData = newsList;
    });
    return newslistData;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Latest News"),
          trailing: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.red,
                      title: const Text("News"),
                    ),
                    body: const NewsFragment(),
                  );
                }));
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              )),
        ),
        FutureBuilder(
          future: getdataNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                    children: List.generate(
                        newsList.length,
                        (int i) => NewsFragmentWidget(
                              news: newsList[i],
                            ))),
              );
            }
          },
        )
      ],
    );
  }
}
