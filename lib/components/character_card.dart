import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  CharacterCard(
      {@required this.id,
      @required this.name,
      @required this.species,
      @required this.status});

  final int id;
  final String name;
  final String species;
  final String status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
        child: Row(children: <Widget>[
          Expanded(
            flex: 3,
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://rickandmortyapi.com/api/character/avatar/$id.jpeg"),
              ),
            ),
          ),
          Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name,
                        style:
                            TextStyle(fontFamily: 'IBMPlexSans', fontSize: 22)),
                    Text(species + ', ' + status,
                        style: TextStyle(
                            fontFamily: 'IBMPlexSans',
                            fontSize: 16,
                            color: Colors.blueGrey))
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
