import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/pokemon.dart';

class PokemonApi {
  static Future<Pokemon?> getPokemonDetails(String name) async {
    try {
      final url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$name");
      final response = await http.get(url);
      final decoded = jsonDecode(response.body) as Map<String, dynamic>;
      return Pokemon.fromJson(decoded);
    } catch (e) {
      throw HttpException(e.toString());
    }
  }

  static Future<String?> getDescription(String name) async {
    try {
      final url = Uri.parse("https://pokeapi.co/api/v2/pokemon-species/$name");
      final response = await http.get(url);
      final decoded = jsonDecode(response.body) as Map<String, dynamic>;

      String description = decoded["flavor_text_entries"][0]["flavor_text"];
      return description.replaceAll('\n', ' ');
    } catch (e) {
      throw HttpException(e.toString());
    }
  }

  static Future<List<dynamic>> getEvolutions(String pokemonName) async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonName'));
    final speciesUrl = json.decode(response.body)['species']['url'];

    final speciesResponse = await http.get(Uri.parse(speciesUrl));
    final evolutionChainUrl =
        json.decode(speciesResponse.body)['evolution_chain']['url'];

    final evolutionChainResponse = await http.get(Uri.parse(evolutionChainUrl));
    dynamic evolutionData = json.decode(evolutionChainResponse.body)['chain'];

    final List<dynamic> evolutions = [];
    while (evolutionData != null) {
      final int minLevel = evolutionData['evolution_details'].isNotEmpty
          ? evolutionData['evolution_details'][0]['min_level']
          : 0;
      final speciesResponse =
          await http.get(Uri.parse(evolutionData['species']['url']));
      final speciesData = json.decode(speciesResponse.body);
      final pokemonResponse = await http
          .get(Uri.parse(speciesData['varieties'][0]["pokemon"]["url"]));

      evolutions.add({
        'pokemon': Pokemon.fromJson(
            json.decode(pokemonResponse.body) as Map<String, dynamic>),
        'level': minLevel
      });

      evolutionData = evolutionData['evolves_to'].isNotEmpty
          ? evolutionData['evolves_to'][0]
          : null;
    }
    return evolutions;
  }
}
