import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/configs/app_routes.dart';
import 'package:pertemuan_v/models/user.dart';
import 'package:pertemuan_v/modules/home_screen/fragments/home_fragment/home_fragment.dart';
import 'package:pertemuan_v/modules/home_screen/fragments/menu_fragment/menu_fragment.dart';
import 'package:pertemuan_v/modules/home_screen/fragments/news_fragment/news_fragment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    // required this.user,
  });
  // final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late Size size;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  late User user;

  tapBottomItem(int index) {
    if (index != 2) {
      setState(() {
        _currentIndex = index;
      });
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  getUserDetail() {
    user = User.dummy();
  }

  @override
  void initState() {
    getUserDetail();
    _pageController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      endDrawer: endDrawer(),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          HomeFragment(
            user: user,
            homeScaffold: scaffoldKey,
          ),
          const NewsFragment(),
          const MenuFragment()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: tapBottomItem,
        items: [
          bottomMenuItem(
            "Home",
            Icons.home_rounded,
          ),
          bottomMenuItem(
            "News",
            Icons.newspaper_rounded,
          ),
          bottomMenuItem(
            "Menu",
            Icons.menu_rounded,
          ),
        ],
      ),
    );
  }

  Drawer endDrawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.network(
                        user.profilePhoto!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: "${user.name} ",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "(${user.username})",
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  user.email,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).goNamed(
                  AppRoutes.profileDetail,
                  extra: User.dummy(),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue[100],
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.edit_rounded,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: Text(
                              "Edit Profile",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomMenuItem(
    String label,
    IconData iconData,
  ) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(
        iconData,
      ),
    );
  }
}
