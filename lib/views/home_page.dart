import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/search_bar.dart';
import '../model/pokemon_list_item.dart';
import '../utils/palette.dart';
import 'widgets/pokemon_list.dart';
import 'widgets/random_floating_button.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/styled_text.dart';

class HomePage extends StatefulWidget {
  static const route = "/";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<PokemonListItem> pokemonList = [];

  @override
  void initState() {
    readJsonFile();
    super.initState();
  }

  void readJsonFile() async {
    final jsonFile = await rootBundle.loadString("assets/pokemonList.json");
    final decoded = jsonDecode(jsonFile);
    for (var item in decoded["pokemonList"]) {
      final pokemonListItem = PokemonListItem(
        name: item["name"],
        url: item["url"],
      );
      pokemonList.add(pokemonListItem);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: RandomFloatingButton(pokemonList: pokemonList),
      bottomNavigationBar: const BottomNavBar(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 76.h, left: 24.w, right: 24.w),
            child: StyledText(
              text: "Pokédex",
              style: textTheme.displaySmall!,
              textHeight: 44.h,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              "Use the advanced search to find Pokémon by type, weakness, ability and more!",
              style: textTheme.bodyLarge
                  ?.copyWith(color: gray[400], height: (24 / 16)),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          const SearchBar(),
          SizedBox(
            height: 24.h,
          ),
          PokemonList(
            pokemonList: pokemonList,
          ),
        ],
      ),
    );
  }
}
