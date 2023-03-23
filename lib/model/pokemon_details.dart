import 'dart:ui';

import 'package:pokeflutter/model/pokemon.dart';

class PokemonDetailArgs {
  final Pokemon pokemon;
  final int pokemonIndex;
  final Color pokemonMainColor;

  PokemonDetailArgs({
    required this.pokemon,
    required this.pokemonIndex,
    required this.pokemonMainColor,
  });
}
