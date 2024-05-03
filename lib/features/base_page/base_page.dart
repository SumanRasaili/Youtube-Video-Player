import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtubeplayer/colors.dart';
import 'package:youtubeplayer/custom_app_bar.dart';
import 'package:youtubeplayer/my_home_page.dart';

class BasePage extends HookConsumerWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int>(0);
    return Scaffold(
        backgroundColor: secondaryColor,
        appBar: const CustomAppBar(),
        body: switch (selectedIndex.value) {
          0 => const HomePage(),
          1 => Container(),
          _ => const SizedBox(),
        },
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                currentIndex: selectedIndex.value,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                onTap: (b) {
                  selectedIndex.value = b;
                },
                backgroundColor: const Color(0xff424242),
                selectedItemColor: pink,
                selectedLabelStyle: const TextStyle(fontFamily: 'Cairo'),
                unselectedLabelStyle: const TextStyle(fontFamily: 'Cairo'),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.local_fire_department),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.live_tv), label: 'Subscriptions'),
                ],
              ),
            )));
  }
}
