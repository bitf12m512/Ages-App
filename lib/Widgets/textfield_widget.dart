import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  Widget prefixIcon;
  String hintText;
  TextInputAction textInputAction;
  TextFieldWidget({
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    required this.textInputAction
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF0F0F0),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff0065F7),
          )
        ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffF7F7F7),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        prefixIcon: prefixIcon,
        hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal:5),
        hintStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xffA1A1A1)
          )
        )
      ),
    );
  }
}
