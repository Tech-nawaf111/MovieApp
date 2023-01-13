
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie/widgets/paint_chair.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/constants.dart';
class SeatTypeDetail extends StatelessWidget {

  const SeatTypeDetail({Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Container(
      child:Column(
        children: [
          Row(
            children:const [
              SizedBox(width: 20,),
              SeatDetails(seatStatus: "Selected",seatTypeColor: AppColors.secondaryColorSeven,),
              SizedBox(width: 50,),
              SeatDetails(seatStatus: "Not Available",seatTypeColor: AppColors.secondaryColorOne,),
            ],
          ),
          Row(
            children:const [
              SizedBox(width: 20,),
              SeatDetails(seatStatus: "VIP (150\$)",seatTypeColor: AppColors.secondaryColorSix,),
              SizedBox(width: 50,),
              SeatDetails(seatStatus: "Regular (50 \$)",seatTypeColor: AppColors.secondaryColorEight,),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20,),
              Container(
                height: 30,
                width: 110,
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.secondaryColorTwo),
child: Row(
  children: [
    const SizedBox(width:10),
     Text("4/",style: GoogleFonts.poppins(fontSize: 18),),
    const Text(" 3 row"),
    const SizedBox(width:10),
    const Icon(
      Icons.close,size: 16,
    )
  ],
),

              )
            ],
          ),
          const SizedBox(height: 20),
          Row(

            children: [
              const SizedBox(width: 20,),
              Container(
                height: 60,
                width: 120,
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.secondaryColorTwo),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 20),
                  child: Column(
                    children: [
                      const SizedBox(height:10),
                      Text("Total Price",style: GoogleFonts.poppins(fontSize: 12),),
                       Text("\$ 50",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold),),
                      const SizedBox(width:10),

                    ],
                  ),
                ),

              ),
              SizedBox(width: 10,),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width*0.60,
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.secondaryColorEight),
                child: Column(
                  children: [
                    const SizedBox(height:15),

                    Text("Proceed to pay",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    const SizedBox(width:10),

                  ],
                ),

              )
            ],

          )
        ],
      ),
    );
  }
}


class SeatDetails extends StatelessWidget {

  const SeatDetails({Key? key,
    required this.seatTypeColor,
    required this.seatStatus,
  }) : super(key: key);

  final String seatStatus;
  final Color seatTypeColor;

  @override
  Widget build(BuildContext context) {

    return  Row(
        children: [
         PaintChair(
            color: seatTypeColor ,rowSize: 0,seatNo: 0,chairHeight: 30,chairWidth: 30,
            rowNo: 0,),
          const SizedBox(width: 5,),
          Text(seatStatus,style: GoogleFonts.poppins(fontSize: 16,color: AppColors.secondaryColorOne),),
        ]);
  }
}

