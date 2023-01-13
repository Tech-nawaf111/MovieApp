import '../../model/genre_model.dart';
import 'package:dio/dio.dart';

import '../../model/movie_details_model.dart';
import '../../model/movie_model.dart';
import '../../model/video_model.dart';

class MovieRepository {
  final String apiKey = "a1f20718942234f78b7e90e33a3383cc";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getMoviesUrl = '$mainUrl/movie/upcoming';
  var getGenresUrl = '$mainUrl/genre/movie/list';
  var getSearchMovie = '$mainUrl/search/movie';
  var getMovieDetails = '$mainUrl/movie';
  var getVideoLink = '$mainUrl/movie/';



  Stream<MoviesModel> loadMovies() async* {

    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1
    };
    final response = await _dio.get(getMoviesUrl, queryParameters: params);
    if (response.statusCode == 200) {
      yield MoviesModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Stream<GenreModel> loadGenres() async* {

    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1
    };
    final response = await _dio.get(getGenresUrl,queryParameters: params);
    if (response.statusCode == 200) {
      yield GenreModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load movies');
    }
  }


  Stream<MoviesModel> searchMovie({required String query}) async* {

    var params = {
      "api_key": apiKey,
      "query": query,
    };
    final response = await _dio.get(getSearchMovie,queryParameters: params);
    if (response.statusCode == 200) {
      print(response.data);
      yield MoviesModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Stream<IndividualMovieModel> searchMovieDetails({required String query}) async* {

    var params = {
      "api_key": apiKey,
    };
    final response = await _dio.get(getMovieDetails+"/"+query,queryParameters: params);
    if (response.statusCode == 200) {
      print(response.data);
      yield IndividualMovieModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load movies');
    }
  }
  Stream<MovieVideoModel> loadVideos({required String movieUrl}) async* {
    var params = {
      "api_key": apiKey,
    };
    final response = await _dio.get("$getVideoLink/$movieUrl/videos",queryParameters: params);
    if (response.statusCode == 200) {
      yield MovieVideoModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load movies');
    }
  }


}


