class IndividualMovieModel {
  final String name;
  final String imageLink;
  final String id;
  final String overview;
  final String date;
  List<Genres> genresData;

  IndividualMovieModel(this.name, this.imageLink, this.id, this.overview,
      this.genresData, this.date);

  IndividualMovieModel.fromJson(Map<String, dynamic> json)
      : name = json['original_title'],
        id = json['id'].toString(),
        imageLink = json['backdrop_path'],
        overview = json['overview'],
        date = json['release_date'],
        genresData = List<dynamic>.from(json['genres'])
            .where(
                (element) => element['id'] != null && element['name'] != null)
            .map((i) => Genres.fromJson(i))
            .toList();
}

class Genres {
  String genreId;
  String genreName;

  Genres(this.genreId, this.genreName);

  Genres.fromJson(Map<String, dynamic> json)
      : genreId = json['id'].toString(),
        genreName = json['name'];
}