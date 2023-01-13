import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie/utility/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../model/movie_details_model.dart';
import '../repository/api_repository/movie_repository.dart';
import '../widgets/trailer_player_screen.dart';
import 'cinema_all_screens_page.dart';

// ignore: must_be_immutable
class MovieDetailPage extends StatefulWidget {
  MovieDetailPage({super.key, required this.searchId});

  String searchId;

  @override
  // ignore: library_private_types_in_public_api
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late Stream<IndividualMovieModel> moviesDetail;
  List<Color> colorRandom = [
    AppColors.secondaryColorFour,
    AppColors.secondaryColorFive,
    AppColors.secondaryColorSix,
    AppColors.secondaryColorSeven
  ];
  Random random = new Random();

  @override
  void initState() {
    super.initState();
    MovieRepository movieRepository = MovieRepository();
    moviesDetail = movieRepository.searchMovieDetails(query: widget.searchId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<IndividualMovieModel>(
      stream: moviesDetail,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final results = snapshot.data!;
          String dateString = results.date;
          DateTime date = DateTime.parse(dateString);
          String formattedDate = DateFormat.yMMMEd("en_US").format(date);
          return (results.name.isNotEmpty)
              ? Material(
                  type: MaterialType.transparency,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*0.55,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${results.imageLink}',
                                ),
                                fit: BoxFit.cover),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    top: 60, start: 20),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      child: const Icon(
                                        Icons.arrow_back_ios,
                                        size: 20,

                                      ),
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Watch",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(top: MediaQuery.of(context).size.height*0.18),
                                child: Column(
                                  children: [
                                    Text(
                                      results.name,
                                      style: GoogleFonts.poppins(
                                          color: AppColors.secondaryColorSeven,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "In Theater $formattedDate",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.transparent),
                                        height: 53,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.60,
                                        child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push<void>(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const CinemaAllScreensPage(
                                                          )),
                                                );



                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: AppColors
                                                    .secondaryColorEight,
                                                foregroundColor: Colors.black,
                                                elevation: 0,
                                              ),
                                              child: Text("Get Tickets",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white)),
                                            ))),
                                    const SizedBox(height: 10),
                                    Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.transparent),
                                        height: 53,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.60,
                                        child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push<void>(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MovieVideoScreen(
                                                              movieId:
                                                                  results.id)),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  foregroundColor: Colors.black,
                                                  elevation: 0,
                                                  side: const BorderSide(
                                                    width: 2.0,
                                                    color: AppColors
                                                        .secondaryColorEight,
                                                  )),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .only(start: 50),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.play_arrow,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "Watch Trailer",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ))),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.only(start: 40, end: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    "Genres",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: AppColors.primaryColorDark),
                                  ),
                                  Wrap(
                                    children: [
                                      for (var i = 0;
                                          i < results.genresData.length;
                                          i++) ...[
                                        Padding(
                                          padding: EdgeInsetsDirectional.all(7),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                color: colorRandom[
                                                    random.nextInt(4)]),
                                            child: Padding(
                                                padding:
                                                    EdgeInsetsDirectional.all(5),
                                                child: Text(results
                                                    .genresData[i].genreName)),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  Divider(color: Colors.black),
                                  Text(
                                    "Overview",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: AppColors.primaryColorDark),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    results.overview,
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: AppColors.secondaryColorOne,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(
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
