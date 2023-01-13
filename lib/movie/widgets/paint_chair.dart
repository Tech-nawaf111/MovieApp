import 'package:flutter/material.dart';
import '../utility/constants.dart';

class PaintChair extends StatelessWidget {

  final Color color;
 final int rowSize;
 final int seatNo;
 final int rowNo;
  final double chairHeight;
  final double chairWidth;
  const PaintChair({Key? key,
    required this.color,
    required this.rowSize,
    required this.seatNo,
    required this.rowNo,
    required this.chairHeight,
    required this.chairWidth }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return rowNo==3&&seatNo==7?Container(
      margin: EdgeInsets.only(right: 3.0, left: seatNo==5?12.0:seatNo==19?12.0:3.0, bottom: 10.0),
      height: chairHeight,
      width: chairWidth,
      child: const CustomPaint(
          painter: _PainterChair(color:AppColors.secondaryColorSeven)
      ),
    ):rowSize<19?Container(
      margin:  EdgeInsets.only(right: 3.0, left: seatNo==2?12.0:seatNo==16?12.0:3.0, bottom: 10.0),
      height: chairHeight,
      width: chairWidth,
      child: CustomPaint(
          painter: _PainterChair(color:color)
      ),
    ):rowSize<23&&rowSize>18?Container(
      margin:  EdgeInsets.only(right: 3.0, left: seatNo==4?12.0:seatNo==18?12.0:3.0, bottom: 10.0),
      height: chairHeight,
      width: chairWidth,
      child: CustomPaint(
          painter: _PainterChair(color:color)
      ),
    ):Container(
      margin: EdgeInsets.only(right: 3.0, left: seatNo==5?12.0:seatNo==19?12.0:3.0, bottom: 10.0),
      height: chairHeight,
      width: chairWidth,
      child: CustomPaint(
          painter: _PainterChair(color:color)
      ),
    );
  }
}



class _PainterChair extends CustomPainter {
  final Color color;
  const _PainterChair({required this.color });

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..color = color
      ..strokeCap =  StrokeCap.round
      ..strokeWidth = 1;

    final paintx = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    final a = Offset(size.width * 1 / 6, size.height * 1 / 4);
    final b = Offset(size.width * 5 / 6, size.height * 3 / 4);
    final rect = Rect.fromPoints(a, b);
    const radius = Radius.circular(1);

    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paintx);



    canvas.drawLine(
    Offset(size.width * 2/6, size.height ),
        Offset(size.width * 4/6, size.height),


        paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}