import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  String text;
  double fontsize;
  FontWeight fontWeight;
  Color color;
  TextAlign? textAlign;
  TextWidget({required this.text,
     this.fontsize=14 ,
    this.textAlign,
     this.fontWeight=FontWeight.bold,
     this.color=Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    textAlign: textAlign,
    style: GoogleFonts.bebasNeue(
      textStyle: TextStyle(
        fontSize: fontsize,
        fontWeight: fontWeight,
          color: color,
      )
    ),

    );
  }
}
