import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/pokemon.dart';

class PokemonEvolutionsApi {
  static Future<List<dynamic>> getEvolutions(String pokemonName) async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonName'));
    final pokemonData = json.decode(response.body);
    final speciesUrl = pokemonData['species']['url'];
    final speciesResponse = await http.get(Uri.parse(speciesUrl));
    final speciesData = json.decode(speciesResponse.body);
    final evolutionChainUrl = speciesData['evolution_chain']['url'];
    final evolutionChainResponse = await http.get(Uri.parse(evolutionChainUrl));
    final evolutionChainData = json.decode(evolutionChainResponse.body);
    dynamic evolutionData = evolutionChainData['chain'];

    final List<dynamic> evolutions = [];
    while (evolutionData != null) {
      final int minLevel = evolutionData['evolution_details'].isNotEmpty
          ? evolutionData['evolution_details'][0]['min_level']
          : 0;
      final species = evolutionData['species'];
      final speciesResponse = await http.get(Uri.parse(species['url']));
      final speciesData = json.decode(speciesResponse.body);
      final pokemonResponse = await http
          .get(Uri.parse(speciesData['varieties'][0]["pokemon"]["url"]));
      final pokemonData =
          json.decode(pokemonResponse.body) as Map<String, dynamic>;
      evolutions
          .add({'pokemon': Pokemon.fromJson(pokemonData), 'level': minLevel});

      evolutionData = evolutionData['evolves_to'].isNotEmpty
          ? evolutionData['evolves_to'][0]
          : null;
    }
    return evolutions;
  }
}
