part of 'movie_tt_bloc.dart';

@immutable
abstract class MovieTtEvent extends Equatable {
  const MovieTtEvent();

  @override
  List<Object> get props => [];
}

class LoadMoviesInfo extends MovieTtEvent {}