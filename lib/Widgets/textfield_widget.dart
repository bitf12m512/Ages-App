import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  Widget prefixIcon;
  String hintText;
  TextInputAction textInputAction;
  FocusNode? focusNode;
  VoidCallback? onTap;
  String? errortext;
  bool readonly;

  TextFieldWidget({Key? key,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    required this.textInputAction,
    this.focusNode,
    this.readonly=false,
    this.onTap,
    this.errortext

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onTap: onTap,
      readOnly: readonly,
      style:GoogleFonts.bebasNeue(
          textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black
          )
      ),
      decoration: InputDecoration(
        errorText: errortext,
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff0065F7),
              )
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffF7F7F7),
            ),
            borderRadius: BorderRadius.circular(7),
          ),

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
            borderRadius: BorderRadius.circular(7),
          ),
        prefixIcon: prefixIcon,
        hintText: hintText,
          errorStyle: const TextStyle(height: 0.7),
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
