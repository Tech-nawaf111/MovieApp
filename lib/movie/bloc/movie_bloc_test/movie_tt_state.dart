part of 'movie_tt_bloc.dart';

@immutable

abstract class MovieTtState extends Equatable {
  const MovieTtState();

  @override
  List<Object> get props => [];
}

class MovieTtInitial extends MovieTtState {}

class MovieTtLoading extends MovieTtState {}

class MovieTtLoaded extends MovieTtState {
  final List<MoviesModel> movieData;
  const MovieTtLoaded({
    required this.movieData,

  });
}

