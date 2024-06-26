import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff2d2d2d),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Color(0xff2d2d2d),
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      elevation: 0.5,
      title: Container(
        padding: const EdgeInsets.only(left: 10),
        child: const Text("Youtube Player"),
        // child: Image.asset("assets/logo.png", width: 200),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            onPressed: () {
              // showSearch(context: context, delegate: DataSearch());
            },
            icon: const Icon(
              Icons.manage_search,
              size: 37,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
