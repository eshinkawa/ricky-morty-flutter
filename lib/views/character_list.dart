import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rickmorty_flutter/model/character_model.dart';
import 'package:rickmorty_flutter/model/result_model.dart';

import '../components/character_card.dart';
import 'package:http/http.dart' as http show get;

class CharactersList extends StatefulWidget {
  CharactersList({Key key}) : super(key: key);

  @override
  _CharactersListState createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  List<CharacterModel> characters = [];

  @override
  void initState() {
    super.initState();
    getCharacters();
  }

  Future<void> getCharacters() async {
    const URL = 'https://rickandmortyapi.com/api/character/';
    var response = await http.get(URL);
    var result = ResultsModel.fromJson(json.decode(response.body));
    characters = result.results;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.black54,
              expandedHeight: 240.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/images/home_img.png',
                    fit: BoxFit.cover),
                title: Text(
                  'R&M Characters List',
                  style: TextStyle(
                      fontFamily: 'IBMPlexSans', fontSize: 18),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => CharacterCard(
                  name: characters[index].name,
                  id: characters[index].id,
                  species: characters[index].species,
                  status: characters[index].status,
                  index: index
                ),
                childCount: characters.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
