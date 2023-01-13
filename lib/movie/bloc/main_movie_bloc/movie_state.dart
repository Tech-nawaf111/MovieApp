part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}


class InitialScreen extends MovieState {
}

class CategoryScreen extends MovieState {}

class AllResultScreen extends MovieState {}

class SpecificResultScreen extends MovieState {}

