import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowInformationQuanity extends StatelessWidget {

  final String value;

  const RowInformationQuanity({
    super.key,
    required this.value
  });

  @override
  Widget build(BuildContext context) {

    return Text(
      value,
      style: GoogleFonts.quicksand(
        color: Colors.black,
        fontSize: 25,
      ),

    );

  }

}