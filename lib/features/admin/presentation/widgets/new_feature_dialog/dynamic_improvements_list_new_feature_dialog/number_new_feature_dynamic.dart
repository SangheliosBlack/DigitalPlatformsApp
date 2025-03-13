import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberNewFeatureDynamic extends StatelessWidget {

  final int number;

  const NumberNewFeatureDynamic({
    super.key,
    required this.number
  });

  @override
  Widget build(BuildContext context) {

    return Text(
      number.toString(),
      style: GoogleFonts.roboto(
          color: Colors.black.withAlpha(200),
          fontSize: 16.0,
          fontWeight: FontWeight.w300
        ),
    );

  }

}