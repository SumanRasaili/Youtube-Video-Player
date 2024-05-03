import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtubeplayer/colors.dart';
import 'package:youtubeplayer/features/base_page/base_page.dart';
import 'package:youtubeplayer/my_home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BasePage(),
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: primaryColor,
          scaffoldBackgroundColor: primaryColor),
    );
  }
}
