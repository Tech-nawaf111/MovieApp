import 'package:flutter/material.dart';
import '../utility/constants.dart';
class SeatingAreaButtons extends StatelessWidget {
  const SeatingAreaButtons({
    Key? key,
    required this.onButtonTap,
    required this.buttonIcon,
  }) : super(key: key);

  final IconData buttonIcon;
  final VoidCallback onButtonTap;

  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(
      shape: const CircleBorder(
        side: BorderSide(
          width: 2.0,
          color: AppColors.secondaryColorTwo,
        ),
      ),
      constraints: const BoxConstraints.tightFor(width: 30.0, height: 30.0),
      fillColor: Colors.white,
      onPressed: onButtonTap,
      child: Icon(
        buttonIcon,
        color: AppColors.primaryColorDark,
        size: 20,
      ),
    );
  }
}

