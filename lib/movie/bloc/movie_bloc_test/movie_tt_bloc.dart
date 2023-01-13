import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/movie_model.dart';
import '../../repository/api_repository/movie_repository.dart';

part 'movie_tt_event.dart';
part 'movie_tt_state.dart';



class MovieTtBloc extends Bloc<MovieTtEvent, MovieTtState> {
  MovieRepository movieRepository = MovieRepository();

  MovieTtBloc() : super(MovieTtInitial()) {
    on<MovieTtEvent>((event, emit) async {
      if (event is LoadMoviesInfo) {
        try {
          emit(MovieTtLoading());

        }
        catch (e) {
         print("error");
        }
      }
    });
  }
}