import 'character_model.dart';

class ResultsModel {
  List<CharacterModel> results;

  ResultsModel({
    this.results,
  });

  ResultsModel.fromJson(parsedJson) {
    if (parsedJson['results'] != null) {
      results = List<CharacterModel>();
      parsedJson['results'].forEach((character) {
        results.add(CharacterModel.fromJson(character));
      });
    }
  }
}
