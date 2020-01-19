import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rickmorty_flutter/model/character_model.dart';
import 'package:rickmorty_flutter/model/result_model.dart';

import 'components/character_card.dart';
import 'package:http/http.dart' as http show get;

// import './components/character_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CharactersList(title: 'Flutter Demo Home Page'),
    );
  }
}

class CharactersList extends StatefulWidget {
  CharactersList({Key key, this.title}) : super(key: key);
  final String title;

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
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 24.0, top: 36.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Characters List',
                    style:
                        TextStyle(fontFamily: 'IBMPlexSans-Bold', fontSize: 40),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(24),
                child: characters.length > 0
                    ? ListView.builder(
                        reverse: false,
                        itemBuilder: (_, int index) => CharacterCard(
                          name: characters[index].name,
                          id: characters[index].id,
                          species: characters[index].species,
                          status: characters[index].status,
                        ),
                        itemCount: characters.length,
                      )
                    : Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 10.0),
                            Text("Loading"),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
