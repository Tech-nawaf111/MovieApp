import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie/repository/api_repository/movie_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/genre_model.dart';
import '../model/movie_model.dart';
class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SearchMoviePageState createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  int extraindex = -2;
  late Stream<GenreModel> genresList;
  late Stream<MoviesModel> upcomingMoviesBackImage;

  @override
  void initState() {
    super.initState();
    MovieRepository movieRepository = MovieRepository();
    genresList = movieRepository.loadGenres();
    upcomingMoviesBackImage = movieRepository.loadMovies();

  }
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<MoviesModel>(
      stream: upcomingMoviesBackImage,
      builder: (context,snapshot) {
      if (snapshot.hasData) {
        final imagesresults = snapshot.data!;
        return (imagesresults.resultsList.isNotEmpty)?

        StreamBuilder<GenreModel>(
          stream: genresList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final results = snapshot.data!;
              return (results.resultsList.isNotEmpty)?
              Container(
              //  height: MediaQuery.of(context).size.height*0.75,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsetsDirectional.only(start:4),
                child:ListView.builder(
                  shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      extraindex += 2;
                      return Container(
                        height:MediaQuery.of(context).size.height*0.18,
                        width:MediaQuery.of(context).size.width,
                        child: Row(
                            children:[
                              Expanded(child: InkWell(
                                child: Container(
                                    height:MediaQuery.of(context).size.height*0.16,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500${imagesresults.resultsList[extraindex].imageLink}',
                                      ),
                                      fit: BoxFit.fill
                                    )
                                  ),
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    padding: EdgeInsets.only(left: 10,bottom: 10),
                                    child: Text(results.resultsList[extraindex].genre, style: GoogleFonts.poppins(
                                        fontSize: 16, color: Colors.white),),
                                  )
                                ),

                              ))
                              , SizedBox(width:10),
                              Expanded(child: InkWell(
                                child: Container(
                                    height:MediaQuery.of(context).size.height*0.16,
                                    //   constraints:BoxConstraints(),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500${imagesresults.resultsList[extraindex+1].imageLink}',
                                            ),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                    child: Container(
                                      alignment: Alignment.bottomLeft,
                                      padding: EdgeInsets.only(left: 10,bottom: 10),
                                      child: Text(results.resultsList[extraindex+1].genre, style: GoogleFonts.poppins(
                                          fontSize: 16, color: Colors.white),),
                                    )
                                ),

                              ))

                            ]
                        ),
                      );

                    }
                ),):

              const Center(
                child: Text('No Data Found'),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ): const Center(
          child: Text('No Data Found'),
        );
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      } else {
        return const Center(child: CircularProgressIndicator());
      }

      },

    );
  }
}