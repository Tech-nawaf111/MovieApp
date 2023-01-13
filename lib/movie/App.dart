import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter_movie_app/movie/utility/constants.dart';
import 'package:flutter_movie_app/movie/view/main_page.dart';
import 'package:flutter_movie_app/movie/view/result_found_page.dart';
import 'package:flutter_movie_app/movie/view/results_page.dart';
import 'package:flutter_movie_app/movie/view/search_page.dart';
import 'bloc/main_movie_bloc/movie_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieBloc(),
      child: const MainScreenArea(),
    );
  }
}

class MainScreenArea extends StatefulWidget {
  const MainScreenArea({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenAreaState createState() => _MainScreenAreaState();
}

class _MainScreenAreaState extends State<MainScreenArea> {
  TextEditingController textController = TextEditingController();
  bool isOpen = true;
  bool isSearching = false;
  bool isText = false;
  bool isAllResult = false;
  String searchingText = "";
  bool finalSearch = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isAllResult== false?
        Container(
          padding: const EdgeInsets.only(top: 40),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: isAllResult==false?Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Stack(children: [
              AnimSearchBar(
                width: 400,
                textController: textController,
                rtl: true,
                textFieldColor: Colors.white,
                onSuffixTapone: () {
                  setState(() {
                    isOpen = true;
                  });
                  BlocProvider.of<MovieBloc>(context).add(
                    NavigatetoMainScreenEvent(),
                  );
                },

                onSuffixTaptwo: () {
                  setState(() {
                    isOpen = false;
                  });
                  BlocProvider.of<MovieBloc>(context).add(
                    NavigateToCategoryEvent(),
                  );
                },
                onChangeOfText: (String n) {
                  if(textController.text.isEmpty){
                    BlocProvider.of<MovieBloc>(context).add(
                      NavigateToCategoryEvent(),
                    );
                  }else{
                    setState(() {
                      searchingText = textController.text;
                      print(searchingText);
                      BlocProvider.of<MovieBloc>(context).add(
                        NavigateToAllResultEvent(),
                      );
                    });
                  }

                },
                onSubmitted: (String s) {
                  setState(() {

                    isAllResult = true;
                  });
                  BlocProvider.of<MovieBloc>(context).add(
                      NavigateToResultEvent());
                },
              ),
              Positioned(
                  top: 45,
                  child: Visibility(
                      visible: isOpen,
                      child: Text("Watch",
                          style: GoogleFonts.poppins(fontSize: 18)))),
            ]),
          ):Container()
        ):
        AppBar(
    title:
    Padding(
      padding: EdgeInsetsDirectional.only(end: MediaQuery.of(context).size.width*0.40),
        child: Text("18 Results Found",style:GoogleFonts.poppins(color: AppColors.primaryColorDark,fontSize: 16))),

    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: Padding(
    padding: const EdgeInsetsDirectional.only(start: 20),
    child: IconButton(
    icon: const Icon(Icons.arrow_back_ios,color: AppColors.primaryColorDark,),
    onPressed: () {
      setState(() {

        isAllResult = false;
      });
      BlocProvider.of<MovieBloc>(context).add(
        NavigateToAllResultEvent(),
      );
    },
    ),
    ),
    ),
        Expanded(
          child: BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
            if (state is CategoryScreen) {
              return Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                    children: const [Expanded(child: SearchMoviePage())]),
              );
            } else if (state is AllResultScreen) {
              return Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(children: [
                  Expanded(
                      child: TopResultsMoviePage(
                    searchText: searchingText,
                  ))
                ]),
              );
            } else if (state is SpecificResultScreen) {
              return  Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Expanded(child: ResultMoviePage(searchText: searchingText)),
              );
            }
            return const Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Expanded(child: MainMoviePage()),
            );
          }),
        ),
      ],
    );
  }
}
