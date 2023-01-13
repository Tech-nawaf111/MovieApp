part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {

}

class NavigatetoMainScreenEvent extends MovieEvent{}
class NavigateToCategoryEvent extends MovieEvent {}
class NavigateToAllResultEvent extends MovieEvent {}
class NavigateToResultEvent extends MovieEvent {}

