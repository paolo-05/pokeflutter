import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class PokeDescFetch {
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
}
