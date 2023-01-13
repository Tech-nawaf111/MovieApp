import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie/repository/api_repository/movie_repository.dart';
import 'package:flutter_movie_app/movie/utility/constants.dart';
import '../model/movie_model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'details_page.dart';

// ignore: must_be_immutable
class ResultMoviePage extends StatefulWidget {
  ResultMoviePage({super.key, required this.searchText});

  String searchText;

  @override
  // ignore: library_private_types_in_public_api
  _ResultsMoviePageState createState() => _ResultsMoviePageState();
}

class _ResultsMoviePageState extends State<ResultMoviePage> {
  late Stream<MoviesModel> moviesResult;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MovieRepository movieRepository = MovieRepository();
    moviesResult = movieRepository.searchMovie(query: widget.searchText);
    return Material(
      child: Column(children: [
        Expanded(
          child: StreamBuilder<MoviesModel>(
            stream: moviesResult,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final results = snapshot.data!;
                return (results.resultsList.isNotEmpty)
                    ? GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: results.resultsList.length,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              // Navigator.pushNamed(
                              //   context,
                              //   '/moviedetail',
                              //   arguments: results.resultsList[index].id,
                              // );
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.secondaryColorOne,
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
                                    ),
                                    onTap: (){
                                      Navigator.push<void>(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MovieDetailPage(searchId:results.resultsList[index].id ,)),
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 20),
                                    //color: Colors.red,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          results.resultsList[index].name,
                                          maxLines: 3,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            //  color: headingColor,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const Text(
                                          'Category None',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            //   color: movieCategoryColor,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: const Icon(Icons.more_horiz,
                                        color: AppColors.secondaryColorEight),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text('No Data Found'),
                      );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('No Data Found'),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ]),
    );
  }
}
