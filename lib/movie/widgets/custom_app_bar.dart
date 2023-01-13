import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/constants.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.context,
    required this.topText,
    required this.bottomText,


  }) : super(key: key);

  final BuildContext context;
  final String topText;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(topText,style:GoogleFonts.poppins(color: AppColors.primaryColorDark,fontSize: 16)),
          const SizedBox(height: 5),
          Text(bottomText,style:GoogleFonts.poppins(color: AppColors.secondaryColorEight,fontSize: 12)),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: AppColors.primaryColorDark,),
          onPressed: () {
            if(topText=="fromback"){

            }else{
              Navigator.pop(context);
            }

          },
        ),
      ),
    );
  }
}

