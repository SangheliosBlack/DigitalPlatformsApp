import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminUserImageWidget extends StatelessWidget {

  const AdminUserImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.white.withAlpha(150)
        ),
        color: Color(0xffDD052B),
        shape: BoxShape.circle
      ),
      child: Container(
        padding: EdgeInsets.all(2),
        width:  30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle
        ),
        child: Center(
          child: Text(
            "JL",
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 15
            ),
          ),
        ),
      ),
    );

  }

}