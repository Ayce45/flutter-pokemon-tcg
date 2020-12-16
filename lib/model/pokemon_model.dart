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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;

    return data;
  }
}
