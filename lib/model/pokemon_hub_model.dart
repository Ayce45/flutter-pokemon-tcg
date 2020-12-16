import 'package:pokemon_tcg/model/pokemon_model.dart';

class PokemonHubModel {
  List<PokemonModel> pokemon;

  PokemonHubModel({this.pokemon});

  PokemonHubModel.fromJson(Map<String, dynamic> json) {
    if (json['cards'] != null) {
      pokemon = new List<PokemonModel>();
      json['cards'].forEach((v) {
        pokemon.add(new PokemonModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemon != null) {
      data['cards'] = this.pokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
