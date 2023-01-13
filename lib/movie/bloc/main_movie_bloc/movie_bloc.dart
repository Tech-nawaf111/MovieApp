import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../model/movie_model.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(InitialScreen()) {
    on<NavigatetoMainScreenEvent>((event, emit) => _onNavigateToMainScreen(event));
    on<NavigateToCategoryEvent>((event, emit) => _onNavigateToCategory(event));
    on<NavigateToAllResultEvent>((event, emit) => _onNavigateToAllResult(event));
    on<NavigateToResultEvent>((event, emit) => _onNavigateToSpecficiResult(event));
  }
  MovieState get initialState => InitialScreen();
  void _onNavigateToCategory(NavigateToCategoryEvent event) async {
    if (event is NavigateToCategoryEvent) {
      emit(CategoryScreen());
    }
  }

  void _onNavigateToMainScreen(NavigatetoMainScreenEvent event) async {
    if (event is NavigatetoMainScreenEvent) {
      emit(InitialScreen());
    }
  }
  void _onNavigateToAllResult(NavigateToAllResultEvent event,) async {
    if (event is NavigateToAllResultEvent) {
      emit(AllResultScreen());
    }
  }
  void _onNavigateToSpecficiResult(NavigateToResultEvent event,) async {
    print("i am in cat");
    if (event is NavigateToResultEvent) {
      print("i am in specific");
      emit(SpecificResultScreen());
    }
  }



}
