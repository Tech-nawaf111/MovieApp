import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/movie/utility/constants.dart';
import 'Bloc_Observer.dart';
import 'movie/App.dart';

void main() {
    return BlocOverrides.runZoned(
            () async {
  runApp(const MyApp());

},
        blocObserver: AppBlocObserver(),
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: App(),
        bottomNavigationBar:
        createBottomBar(context) ,
    );
  }

  Container createBottomBar(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          //add background color
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primaryColorDark,
          unselectedItemColor: AppColors.secondaryColorThree,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.slow_motion_video_outlined),
              label: 'Watch',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: 'Media Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'More',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}



