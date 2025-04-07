import 'package:flutter/material.dart';

import 'package:flutter_template/core/core.dart';
import 'package:google_fonts/google_fonts.dart';

class NewReleaseTitleMediaInput extends StatelessWidget {

  const NewReleaseTitleMediaInput({super.key});

  @override
  Widget build(BuildContext context) {

    return  Text(
      UiConstants.createNewReleaseMediaTitle,
      style: GoogleFonts.quicksand(
      fontSize: 12,
      color: Colors.grey
      ),
    );

  }

}
