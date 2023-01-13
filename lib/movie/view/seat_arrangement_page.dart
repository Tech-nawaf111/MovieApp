import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie/widgets/custom_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_movie_app/movie/widgets/painter.dart';
import 'package:flutter_movie_app/movie/widgets/seating_area.dart';
import '../utility/constants.dart';
import '../widgets/seat_type_detail.dart';

class BuyTicketPage extends StatefulWidget {
  BuyTicketPage({Key? key,}) : super(key: key);



  @override
  _BuyTicketPageState createState() => _BuyTicketPageState();
}


class _BuyTicketPageState extends State<BuyTicketPage> {

  double _scale = 1.2;

  void _zoomIn() {
    setState(() {
      if(_scale==1.2){
        return;
      }
      _scale += 0.2;
    });
  }

 void _zoomOut() {
    setState(() {
      if(_scale==0.8){
        return;
      }
      _scale -= 0.2;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
          child: CustomAppBar(context: context,topText: "The King's Man",bottomText: "March 5,2021 | 12:30 Hall 1",)),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.54,
                width: MediaQuery.of(context).size.width,
                color: AppColors.primaryColorLight,
            child: Column(
              children:  [

                const SizedBox(height: 30.0),
                const PainterScreenMovie(),
                Text('SCREEN', style: GoogleFonts.poppins(color: AppColors.secondaryColorOne,)),
                const SizedBox(height: 45.0),
                const SeatingArea(),
                const SizedBox(height: 10.0),

              ],
            ),
          ),
          const SeatTypeDetail(),


        ],
      ),
    );
  }
}

