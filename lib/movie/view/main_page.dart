import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie/repository/api_repository/movie_repository.dart';
import 'package:flutter_movie_app/movie/view/seat_arrangement_page.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/movie_model.dart';
import 'details_page.dart';
class MainMoviePage extends StatefulWidget {

  const MainMoviePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainMoviePageState createState() => _MainMoviePageState();
}

class _MainMoviePageState extends State<MainMoviePage> {
  late Stream<MoviesModel> upcomingMovies;


  @override
  void initState() {
    super.initState();
    MovieRepository movieRepository = MovieRepository();
    upcomingMovies = movieRepository.loadMovies();
  }


  @override
  Widget build(BuildContext context) {


    return StreamBuilder<MoviesModel>(
        stream: upcomingMovies,
        builder: (context, snapshot) {
      if (snapshot.hasData) {
        final results = snapshot.data!;
        return (results.resultsList.isNotEmpty)?
            ListView.builder(
            itemCount: results.resultsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 30),
                child: Stack(
                    children: [

                      InkWell(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${results.resultsList[index].imageLink}',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.90,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(top: 160,start: 15),
                            child: Text(results.resultsList[index].name, style: GoogleFonts.poppins(
                                fontSize: 20, color: Colors.white),),
                          ),
                        ),
                        onTap: () {
if (kDebugMode) {
  print("movie id is ${results.resultsList[index].id}");
}
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>    MovieDetailPage(searchId: results.resultsList[index].id,)),
                          );
                        },
                      ),
                    ]
                ),
              );
            }
        ):


        const Center(
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