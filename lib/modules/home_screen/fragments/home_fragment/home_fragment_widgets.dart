import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/configs/app_routes.dart';

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
  ) {
    return HotestNewsCard(
      size: size,
      pictureUrl: pictureUrl,
      newsTitle: newsTitle,
    );
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
  const HotestNewsCard({
    super.key,
    required this.size,
    required this.pictureUrl,
    required this.newsTitle,
  });

  final Size size;
  final String pictureUrl;
  final String newsTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            16,
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              pictureUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 50,
            width: size.width - 32,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Text(
            newsTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class LatestNewsCard extends StatelessWidget {
  const LatestNewsCard({
    super.key,
    required this.size,
    required this.i,
  });

  final Size size;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.black12,
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).goNamed(
                AppRoutes.newsDetail,
                params: {
                  "id": i.toString(),
                },
              );
            },
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.25,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(
                        "https://picsum.photos/200",
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${i + 1}. Laboris fugiat eiusmod consequat aliqua eiusmod.",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}

class LatestNewsSection extends StatelessWidget {
  const LatestNewsSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < 10; i++)
          LatestNewsCard(
            size: size,
            i: i,
          ),
      ],
    );
  }
}
