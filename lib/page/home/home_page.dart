import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_tcg/api/pokemon_tcg_api.dart';
import 'package:pokemon_tcg/model/pokemon_model.dart';
import 'package:pokemon_tcg/page/pokemon/pokemon_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PokemonModel> _pokemonModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evan JUGE'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                List<PokemonModel> pokemonModel = await getPokemon();
                setState(() {
                  _pokemonModel = pokemonModel;
                });
              })
        ],
      ),
      body: SafeArea(
        child: Container(
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_pokemonModel == null) {
      return Center(
        child: Text('No pokemon please refresh'),
      );
    } else {
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _pokemonModel.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PokemonDetailPage(_pokemonModel[index]),
                    ));
              },
              child: Container(
                height: 121,
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: _pokemonModel[index].imageUrl,
                      height: 80,
                    ),
                    Container(width: 10),
                    Text(
                      _pokemonModel[index].name,
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(width: 20),
                  ],
                ),
              ),
            );
          });
    }
  }
}
