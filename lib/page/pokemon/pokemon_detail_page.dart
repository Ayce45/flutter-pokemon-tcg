import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_tcg/model/pokemon_model.dart';

class PokemonDetailPage extends StatelessWidget {
  PokemonModel _pokemonModel;

  PokemonDetailPage(this._pokemonModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pokemonModel.name),
        ),
        body: Container(
          color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Stack(
              children: [
                Positioned(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width - 30,
                    top: MediaQuery.of(context).size.height * 0.2,
                    child: Card(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ))),
                Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl: _pokemonModel.imageUrl,
                        ),
                      ),
                    ),
                    Container(height: 20),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _pokemonModel.id,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(_pokemonModel.name,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
