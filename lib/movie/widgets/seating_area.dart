import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie/widgets/seating_area_button.dart';
import 'package:flutter_movie_app/movie/widgets/seats.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/armchairs_model.dart';
import '../utility/constants.dart';

class SeatingArea extends StatefulWidget {
  const SeatingArea({
    Key? key,
  }) : super(key: key);

  @override
  _SeatingAreaState createState() => _SeatingAreaState();
}

class _SeatingAreaState extends State<SeatingArea> {
  double _scale = 1.2;

  void _zoomIn() {
    setState(() {
      if (_scale == 1.2) {
        return;
      }
      _scale += 0.2;
    });
  }

  void _zoomOut() {
    setState(() {
      if (_scale == 0.8) {
        return;
      }
      _scale -= 0.2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(

      children:[
        Row(
          children:[

            Column(
                children: List.generate(
                  10,
                      (i) =>Padding(
                      padding: const EdgeInsetsDirectional.only(top:8),
                      child: Text((i+1).toString(),style: GoogleFonts.poppins(fontSize: 8),)),)),
const SizedBox(width: 50),
            Padding(
              padding: const EdgeInsetsDirectional.only(top:15),
              child: Column(
                children: <Widget>[
                  Transform.scale(
                    scale: _scale,
                    child: Container(
                        child: Column(
                          children: List.generate(
                              ArmChairsModel.listChairs.length,
                                  (i) =>SeatsRow(
                                    rowNo: i+1,
                                numSeats: ArmChairsModel.listChairs[i].seats,
                                freeSeats: ArmChairsModel.listChairs[i].freeSeats,
                                rowSeats: ArmChairsModel.listChairs[i].rowSeats,
                              )),
                        )),
                  ),

                ],
              ),
            ),

          ],

        ),

        const SizedBox(height: 80,),
        Row(
          children: <Widget>[
            SizedBox(width: MediaQuery.of(context).size.width * 0.70),
            SeatingAreaButtons(
              buttonIcon: Icons.add,
              onButtonTap: () {
                _zoomIn();
              },
            ),
            SeatingAreaButtons(
                buttonIcon: Icons.remove,
                onButtonTap: () {
                  _zoomOut();
                }),
          ],
        ),
        const Padding(
            padding: EdgeInsetsDirectional.only(start: 30, end: 30),
            child: Divider(
              thickness: 5,
              color: AppColors.secondaryColorOne,
            ))
      ]


    );
  }
}
