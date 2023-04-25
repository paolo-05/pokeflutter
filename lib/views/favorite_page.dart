import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/palette.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/styled_text.dart';

class FavoritePage extends StatefulWidget {
  static const route = "/favorite-page";

  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 76.h, left: 24.w, right: 24.w),
            child: StyledText(
              text: "Favorites",
              style: textTheme.displaySmall!,
              textHeight: 44.h,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              "This is the list of your favorite Pokémons!",
              style: textTheme.bodyLarge
                  ?.copyWith(color: gray[400], height: (24 / 16)),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
