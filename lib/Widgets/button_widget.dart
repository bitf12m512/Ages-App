import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  VoidCallback onPressed;
  String text;

  ButtonWidget({required this.onPressed,required this.text,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:   BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.4,0.8],
          colors: [Color(0xffFFCB00), Color(0xffC96400)],
        ),
        borderRadius: BorderRadius.circular(5)
      ),
      child: MaterialButton(onPressed: onPressed,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(text,
            style: GoogleFonts.bebasNeue(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5
                )
            ),
          ),
        ),
      ),
    );
  }
}
