import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/movie_model.dart';
import '../../repository/api_repository/movie_repository.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(Initial()) {
    on<LoadMainPageEvent>((event, emit) => _onNavigateToCategory(event));
  }

  void _onNavigateToCategory(LoadMainPageEvent event) async {
    if (event is LoadMainPageEvent) {

      emit(loading());
      late Stream<MoviesModel> upcomingMovies;
      MovieRepository movieRepository = MovieRepository();
      upcomingMovies =  movieRepository.loadMovies();

      emit(loaded()
    // movies: upcomingMovies
    //
    //   )
      );
    }
  }
}
