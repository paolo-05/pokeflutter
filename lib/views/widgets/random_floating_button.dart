import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/pokemon.dart';
import '../../model/pokemon_details.dart';
import '../../model/pokemon_list_item.dart';
import '../../utils/palette.dart';
import '../../utils/pokemon_description_api.dart';
import '../../utils/pokemon_api.dart';
import '../../utils/pokemon_evolutions_api.dart';
import '../detail_page.dart';
import 'styled_text.dart';
import '../../utils/pokemon_costants.dart';

class RandomFloatingButton extends StatefulWidget {
  final List<PokemonListItem> pokemonList;
  const RandomFloatingButton({super.key, required this.pokemonList});

  @override
  State<RandomFloatingButton> createState() => _RandomFloatingButtonState();
}

class _RandomFloatingButtonState extends State<RandomFloatingButton> {
  Pokemon? pokemon;
  Color? pokemonColor;
  String? pokemonDescription;
  List<dynamic>? evolutionData;
  int? randomIndex;
  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchPokemonData() async {
    int index = Random().nextInt(widget.pokemonList.length);
    String pokeName = widget.pokemonList[index].name;
    pokemon = await PokemonApi.getPokemonDetails(pokeName);
    pokemonColor = listPokemonTypeColor[pokemon?.typesList[0].toLowerCase()];
    pokemonDescription = await PokemonDescriptionApi.getDescription(pokeName);
    evolutionData = await PokemonEvolutionsApi.getEvolutions(pokeName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPokemonData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return FloatingActionButton.extended(
          backgroundColor: const Color(0xFFFFCC00),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          elevation: 0,
          icon: Icon(
            Icons.auto_awesome,
            color: gray[500],
          ),
          label: StyledText(
            text: "Random",
            style: Theme.of(context).textTheme.labelLarge!,
            textHeight: 20.h,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(
              DetailPage.route,
              arguments: PokemonDetailArgs(
                pokemon: pokemon!,
                pokemonMainColor: pokemonColor!,
                pokemonIndex: pokemon!.id,
                pokemonDescription: pokemonDescription!,
                pokemonEvolutions: evolutionData!,
              ),
            );
            fetchPokemonData();
          },
        );
      },
    );
  }
}
