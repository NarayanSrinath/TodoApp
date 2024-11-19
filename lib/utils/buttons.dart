import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
  final String buttonText;
  VoidCallback onPressed;
   Buttons({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(onPressed: onPressed,
    color: Colors.yellow.shade500,
    child: Text(
            buttonText,
            style: GoogleFonts.lato(
              fontSize: 15,
           
              fontStyle: FontStyle.normal,
              textStyle: const TextStyle(color: Colors.black)
            ),
          ),);
  }
}