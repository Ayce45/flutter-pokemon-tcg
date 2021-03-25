import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_tcg/model/pokemon_hub_model.dart';
import 'package:pokemon_tcg/model/pokemon_model.dart';

String url = 'https://pastebin.com/raw/49eDjwEs';
List<PokemonModel> pokemonList = [];
PokemonHubModel pokemonHubModel;

Future<List<PokemonModel>> getPokemon() async {
  var res = await http.get(url);
  var decodedJson = jsonDecode(res.body);
  pokemonHubModel = PokemonHubModel.fromJson(decodedJson);

  return pokemonHubModel.pokemon;
}
