import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/theme.dart';
import 'views/home_page.dart';
import 'views/detail_page.dart';
import 'views/favorite_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 979),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Pokédex',
          theme: pokeFlutterTheme,
          routes: {
            /// Dichiarazione della pagina di dettaglio del Pokemon
            DetailPage.route: (context) => const DetailPage(),
            FavoritePage.route: (context) => const FavoritePage()
          },
          home: const HomePage(),
        );
      },
    );
  }
}
