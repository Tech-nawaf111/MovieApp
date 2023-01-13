part of 'main_page_bloc.dart';

@immutable
abstract class MainPageState {}

class Initial extends MainPageState {}
class loading extends MainPageState {}
class loaded extends MainPageState {
  loaded({
    this.movies = const <MoviesModel>[],
  });

  final List<MoviesModel> movies;


  // loaded copyWith({
  //   List<MoviesModel>? movies,
  // }) {
  //   return loaded(
  //     movies: posts ?? this.movies,
  //   );
  // }



  @override
  List<Object> get props => [ movies,];
}