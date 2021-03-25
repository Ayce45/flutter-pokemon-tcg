class PokemonModel {
  String id;
  String name;
  String imageUrl;

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
  }

  @override
  String toString() {
    return 'PokemonModel{id: $id, name: $name, imageUrl: $imageUrl}';
  }
}
