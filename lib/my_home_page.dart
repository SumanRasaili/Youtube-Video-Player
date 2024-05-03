import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtubeplayer/features/categories/screens/gaming.dart';
import 'package:youtubeplayer/features/categories/screens/movies.dart';
import 'package:youtubeplayer/features/categories/screens/music.dart';
import 'package:youtubeplayer/features/categories/screens/trending.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonsTabBar(

                // Customize the appearance and behavior of the tab bar
                backgroundColor: Colors.red,
                borderWidth: 2,
                buttonMargin: const EdgeInsets.all(4),
                contentPadding: const EdgeInsets.all(10),
                borderColor: Colors.black,
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                // Add your tabs here
                tabs: const [
                  Tab(
                    child: Text("Trending"),
                  ),
                  Tab(
                    child: Text("Music"),
                  ),
                  Tab(
                    child: Text("Gaming"),
                  ),
                  Tab(
                    child: Text("Movies"),
                  ),
                ]),
            const Expanded(
              child: TabBarView(children: [
                TrendingVideos(),
                TrendingMusic(),
                TrendingGames(),
                TrendingMovies(),
              ]),
            ),
          ],
        ));
  }

  // Future<bool> _refresh() async {
  //   List<Video> newList = await youtubeDataApi.fetchTrendingVideo();
  //   if (newList.isNotEmpty) {
  //     setState(() {
  //       contentList = newList;
  //     });
  //     return true;
  //   }
  //   return false;
  // }
}
