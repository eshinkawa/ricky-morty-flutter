import 'package:http/http.dart' as http;

const base_url = 'https://rickandmortyapi.com/api/character/';

class API {
  static Future getCharacters() async {
    return await http.get(base_url);
  }
}