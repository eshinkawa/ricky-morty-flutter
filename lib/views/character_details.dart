import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  CharacterDetails(
      {@required this.id,
      @required this.index,
      @required this.name,
      @required this.species,
      @required this.status});

  final int id;
  final int index;
  final String name;
  final String species;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black87,
        leading: IconButton(
            tooltip: name,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Hero(
                tag: 'character$index',
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://rickandmortyapi.com/api/character/avatar/$id.jpeg"), fit: BoxFit.cover)),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.redAccent,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      height: 80,
                      child: Center(
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontFamily: 'IBMPlexSans'),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.white54,
                    ),
                    Container(
                      padding: EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'STATUS',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'IBMPlexSans'),
                          ),
                          Text(
                            status,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'IBMPlexSans'),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.white54,
                    ),
                    Container(
                      padding: EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'SPECIES',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'IBMPlexSans'),
                          ),
                          Text(
                            species,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'IBMPlexSans'),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.white54,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
