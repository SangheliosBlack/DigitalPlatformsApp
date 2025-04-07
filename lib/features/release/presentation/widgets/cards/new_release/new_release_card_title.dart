import 'package:flutter_template/core/core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class NewReleaseCardTitle extends StatelessWidget {

  const NewReleaseCardTitle({super.key});

  @override
  Widget build(BuildContext context) {

    return Text(
      UiConstants.createNewReleaseTitle,
      style: GoogleFonts.lora(
        fontSize: 27,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      maxLines: 5,
    );

  }
  
}