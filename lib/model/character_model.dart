class CharacterModel {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  String image;
  String url;
  String created;

  CharacterModel(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.image,
      this.url,
      this.created});

  CharacterModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    status = parsedJson['status'];
    species = parsedJson['species'];
    type = parsedJson['type'];
    gender = parsedJson['gender'];
    image = parsedJson['image'];
    url = parsedJson['url'];
    created = parsedJson['created'];
  }
}