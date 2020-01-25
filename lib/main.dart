
import 'package:flutter/material.dart';
import 'package:rickmorty_flutter/views/splash.dart';

import 'views/character_list.dart';


// import './components/character_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/Characters': (context) => CharactersList(),
      },
    );
  }
}