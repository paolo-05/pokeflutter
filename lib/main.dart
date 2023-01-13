import 'package:flutter/material.dart';

import 'views/home_page.dart';
import 'utils/palette.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: pokeFlutterTheme,
      home: const HomePage(),
    );
  }
}
