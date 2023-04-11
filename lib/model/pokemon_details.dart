import 'dart:ui';

import 'package:pokeflutter/model/pokemon.dart';

/// Classe che definisce la struttura dei dati da passare alla pagina di dettaglio
class PokemonDetailArgs {
  final Pokemon pokemon;
  final int pokemonIndex;
  final Color pokemonMainColor;
  final String pokemonDescription;
  final List<dynamic> pokemonEvolutions;

  PokemonDetailArgs({
    required this.pokemon,
    required this.pokemonIndex,
    required this.pokemonMainColor,
    required this.pokemonDescription,
    required this.pokemonEvolutions,
  });
}
