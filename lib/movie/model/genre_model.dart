class GenreModel {

  List<GenreModelResults> resultsList;
  GenreModel(this.resultsList);
  GenreModel.fromJson(Map<String, dynamic> json)
      : resultsList = List<dynamic>.from(json['genres'])
      .where((element) =>
  element['name'] != null)
      .map((i) => GenreModelResults.fromJson(i)).toList();
}

class GenreModelResults {
  final String genre;

  GenreModelResults(this.genre,);

  GenreModelResults.fromJson(Map<String, dynamic> json)
      : genre = json['name'];
}