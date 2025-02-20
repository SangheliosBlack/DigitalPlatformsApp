import 'package:flutter/material.dart';
import 'package:flutter_template/core/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentTaskLabel extends StatelessWidget {

  const CurrentTaskLabel({super.key});

  @override
  Widget build(BuildContext context) {

    return Text(
      UiConstants.currentTaskLabel,
      style:  GoogleFonts.quicksand(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 18
      ),
    );

  }

}