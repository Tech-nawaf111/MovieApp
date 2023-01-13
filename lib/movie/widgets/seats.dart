import 'package:flutter/material.dart';
import '../utility/constants.dart';
import 'paint_chair.dart';

class SeatsRow extends StatelessWidget {

  final int numSeats;
  final List<int> freeSeats;
  final int rowSeats;
  final int rowNo;
  const SeatsRow({Key? key,
    required this.rowNo,
    required this.rowSeats,
    required this.numSeats,
    required this.freeSeats

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(numSeats, (i) {

          if(freeSeats.contains(i+1)){

            return InkWell(
                onTap: (){},
                child:
                PaintChair(
                            color: AppColors.secondaryColorEight ,rowSize: numSeats,seatNo: i,chairHeight: 7,chairWidth: 7,
                        rowNo: rowNo,)

            );
          }
          if(rowSeats==10){
           return PaintChair(
              color: AppColors.secondaryColorSix,rowSize: numSeats,seatNo: i,chairHeight: 7, chairWidth: 7,rowNo: rowNo,);
          }

          return  PaintChair(color:AppColors.secondaryColorOne,rowSize: numSeats,seatNo: i,chairHeight: 7,chairWidth: 7,rowNo: rowNo,);

        }),
      ),
    );
  }
}