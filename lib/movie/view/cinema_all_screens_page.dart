import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie/view/seat_arrangement_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/constants.dart';
import '../widgets/custom_app_bar.dart';
import 'details_page.dart';
class CinemaAllScreensPage extends StatefulWidget {

  const CinemaAllScreensPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CinemaAllScreensPageState createState() => _CinemaAllScreensPageState();
}

class _CinemaAllScreensPageState extends State<CinemaAllScreensPage> {
  int selectedIndex = -1;
  int selectedIndexForContainer = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 20),
          child: CustomAppBar(context: context,topText: "The King's Man",bottomText: "In Theaters December, 2021",) ,


    ),
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:   [
         const SizedBox(height:90),
          Padding(padding: EdgeInsetsDirectional.only(end: MediaQuery.of(context).size.width*0.85),
          child: Text("Date",style: GoogleFonts.poppins(color: AppColors.primaryColorDark,fontWeight: FontWeight.w500),)),
          Container(
            padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
            height: 35,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                for (int i = 5; i < 20; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = i;
                        });
                      },
                      child: Container(
                        width: 65,
                        height: 100,
                        decoration: BoxDecoration(
                          color: (i == selectedIndex) ? AppColors.secondaryColorEight : AppColors.secondaryColorTwo,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            '$i Mar',
                            style: GoogleFonts.poppins(color:(i == selectedIndex) ?Colors.white:Colors.black ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height:30),
      Container(
        padding: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
        height: MediaQuery.of(context).size.height*0.25,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            for (int i = 1; i < 3; i++)
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Column(
                children:[
                  Padding(
                    padding: EdgeInsets.only(right: 110),
                    child: RichText(
                      text: TextSpan(
                        text: i==1?'12:30':"13:30",
                        style: GoogleFonts.poppins(color: AppColors.primaryColorDark),
                        children: <TextSpan>[
                          TextSpan(text: ' Cinetech + Hall $i', style: GoogleFonts.poppins(color: AppColors.secondaryColorOne)),
                        ],
                      ),
                    ),
                  ),
                InkWell(
                  onTap: (){
                    setState(() {
                      selectedIndex = i;
                    });
                  },
                  child: GestureDetector(
                    child: Container(
  width: MediaQuery.of(context).size.width*0.60,
  height: MediaQuery.of(context).size.height*0.15,
  decoration: BoxDecoration(
    color: AppColors.primaryColorLight,
    border: Border.all(color: (i == selectedIndex) ? AppColors.secondaryColorEight : AppColors.secondaryColorTwo, width: 1),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Center(
    child: Image.asset("assets/images/hallimage.png",fit: BoxFit.cover,)
  ),

                      ),
                    onTap: (){
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                             BuyTicketPage(
                            )),
                      );

                    },
                  ),
                ),
                  Padding(
                    padding: EdgeInsets.only(right: 90),
                    child: RichText(
                      text: TextSpan(
                        text:"From",
                        style: GoogleFonts.poppins(color: AppColors.secondaryColorOne),
                        children: <TextSpan>[
                          TextSpan(text: i==1?" 50\$":" 75\$", style: GoogleFonts.poppins(color: AppColors.primaryColorDark)),
                          TextSpan(text: " or ", style: GoogleFonts.poppins(color: AppColors.secondaryColorOne)),
                          TextSpan(text: i==1?"2500 bonus":"3000 bonus", style: GoogleFonts.poppins(color: AppColors.primaryColorDark)),
                        ],
                      ),
                    ),
                  ),



                ]
                ),
              ),
          ],
        ),
      ),
          SizedBox(height: MediaQuery.of(context).size.height*0.30,),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width*0.90,
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.secondaryColorEight),
            child: Column(
              children: [
                const SizedBox(height:15),

                Text("Select Seats",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),),
                const SizedBox(width:10),

              ],
            ),

          )


        ],
      ),

    ),
    );
  }
}