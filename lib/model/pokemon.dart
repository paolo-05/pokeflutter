class Pokemon {
  final int id;
  final String name;
  final String speciesUrl;
  final String urlSprite;
  final String urlImage;
  final double weight;
  final double height;
  final List<String> typesList;
  final List<String> abilitiesList;
  final List<int> statsList;
  final List<String> movesList;

  Pokemon({
    required this.id,
    required this.name,
    required this.speciesUrl,
    required this.urlSprite,
    required this.urlImage,
    required this.weight,
    required this.height,
    required this.typesList,
    required this.abilitiesList,
    required this.statsList,
    required this.movesList,
  });

  Pokemon.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        urlSprite = json["sprites"]["front_default"],
        urlImage =
            json["sprites"]["other"]["official-artwork"]["front_default"],
        name = json["species"]["name"],
        weight = json["weight"].toDouble() / 10.0,
        height = json["height"].toDouble() * 10.0,
        typesList = getListTypesFromJson(json["types"]),
        abilitiesList = getListAbilitiesFromJson(json["abilities"]),
        statsList = getListStatsFromJson(json["stats"]),
        movesList = getListMovesFromJson(json["moves"]),
        speciesUrl = json["species"]["url"];
}

List<String> getListTypesFromJson(List<dynamic> json) {
  final List<String> typesList = [];
  for (var element in json) {
    typesList.add(element["type"]["name"]);
  }
  return typesList;
}

List<String> getListAbilitiesFromJson(List<dynamic> json) {
  final List<String> abilitiesList = [];
  for (var element in json) {
    abilitiesList.add(element["ability"]["name"]);
  }

  return abilitiesList;
}

List<int> getListStatsFromJson(List<dynamic> json) {
  final List<int> abilitiesList = [];
  for (var element in json) {
    abilitiesList.add(element["base_stat"]);
  }
  return abilitiesList;
}

List<String> getListMovesFromJson(List<dynamic> json) {
  final List<String> abilitiesList = [];
  for (var element in json) {
    abilitiesList.add(element["move"]["name"]);
  }
  return abilitiesList;
}
