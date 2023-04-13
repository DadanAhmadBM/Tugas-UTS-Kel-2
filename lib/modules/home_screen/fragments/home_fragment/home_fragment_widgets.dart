import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/configs/app_routes.dart';

import '../../../../models/news.dart';
import '../../../../models/user.dart';

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

  static sectionTitle(String label) {
    return SectionTitle(label: label);
  }

  static hotestNewsCard(
    Size size,
    String pictureUrl,
    String newsTitle,
    News news,
  ) {
    return HotestNewsCard(size: size, news: news);
  }

  static latestNewsCard(Size size, int i) {
    return LatestNewsCard(size: size, i: i);
  }

  static latestNewsSection(Size size) {
    return LatestNewsSection(size: size);
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
            const Text("Hi, Selamat datang"),
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
        hintText: "Masukkan kata kunci disini",
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        suffixIcon: const Icon(
          Icons.search_rounded,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const Icon(
          Icons.chevron_right_rounded,
        ),
      ],
    );
  }
}

class HotestNewsCard extends StatelessWidget {
  News news;
  HotestNewsCard({
    super.key,
    required this.news,
  });

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
            height: 100,
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
              subtitle: Text(
                news.content!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class LatestNewsCard extends StatelessWidget {
//   const LatestNewsCard({
//     super.key,
//     required this.size,
//     required this.i,
//   });

//   final Size size;
//   final int i;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(
//               8,
//             ),
//             color: Colors.white,
//             boxShadow: const [
//               BoxShadow(
//                 spreadRadius: 1,
//                 color: Colors.black12,
//               ),
//             ],
//           ),
//           child: InkWell(
//             onTap: () {
//               GoRouter.of(context).goNamed(
//                 AppRoutes.newsDetail,
//                 params: {
//                   "id": i.toString(),
//                 },
//               );
//             },
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: size.width * 0.25,
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(8),
//                       bottomLeft: Radius.circular(8),
//                     ),
//                     child: AspectRatio(
//                       aspectRatio: 1 / 1,
//                       child: Image.network(
//                         "https://picsum.photos/200",
//                       ),
//                     ),
//                   ),
//                 ),
//                 Flexible(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "${i + 1}. Laboris fugiat eiusmod consequat aliqua eiusmod.",
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 4,
//         ),
//       ],
//     );
//   }
// }

class LatestNewsSection extends StatelessWidget {
  const LatestNewsSection({
    super.key,
    required this.size,
  });

  final Size size;

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
