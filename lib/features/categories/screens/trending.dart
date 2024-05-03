import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtubeplayer/features/categories/repository/repository.dart';
import 'package:youtubeplayer/item_body.dart';

class TrendingVideos extends ConsumerWidget {
  const TrendingVideos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build called");
    return FutureBuilder(
      future: ref.read(categoryRepositoryProvider).getTrendingVideos(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print("snapshot data${snapshot.data}");
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.active:
            return const Padding(
              padding: EdgeInsets.only(top: 300),
              child: Center(child: CircularProgressIndicator()),
            );
          case ConnectionState.none:
            return const Text("Connection None");
          case ConnectionState.done:
            if (snapshot.error != null) {
              return Container(child: Text(snapshot.stackTrace.toString()));
            } else {
              if (snapshot.hasData) {
                return VideoBody(
                  contentList: snapshot.data,
                );
              } else {
                return Center(child: Container(child: const Text("No data")));
              }
            }
        }
      },
    );
  }
}
