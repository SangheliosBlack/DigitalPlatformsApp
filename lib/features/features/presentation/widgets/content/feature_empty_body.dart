import 'package:flutter/material.dart';
import 'package:flutter_template/helpers/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureEmptyBody extends StatelessWidget {

  const FeatureEmptyBody({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: context.height - 100,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Image(
              image: AssetImage(
                "assets/images/empty_2.png"
              )
            ),
            Text(
              "No hay ningun resultado",
              style: GoogleFonts.quicksand(
                color: Colors.black
              ),
            )
          ]
        ),
      ),
    );
  }
  
}