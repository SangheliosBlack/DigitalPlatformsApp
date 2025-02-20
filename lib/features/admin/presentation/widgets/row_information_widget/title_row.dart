import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleRow extends StatelessWidget {

  final String cardTitle;

  const TitleRow({
    super.key,
    required this.cardTitle
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      spacing: 5,
      children: [
        Text(
          cardTitle,
          style: GoogleFonts.quicksand(
            color: Colors.black.withAlpha(150),
            fontSize: 12,
          ),
        ),
        Icon(
          BootstrapIcons.info_circle,
          color: Colors.grey.withAlpha(150),
          size: 11,
        )
      ],
    );

  }

}