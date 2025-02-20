import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class RowInformationDescription extends StatelessWidget {

  final String percent;

  const RowInformationDescription({
    super.key,
    required this.percent
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      spacing: 7,
      children: [
        Text(
          "vs la Semana pasada",
          style: GoogleFonts.quicksand(
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.backgroundGreen,
            borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 3
          ),
          child: Row(
            spacing: 5,
            children: [
              Text(
                "$percent%",
                style: GoogleFonts.quicksand(
                  color: AppTheme.primaryGreen,
                  fontSize: 10
                ),
              ),
              Icon(
                BootstrapIcons.arrow_up_right,
                color: AppTheme.primaryGreen,
                size: 9,
              )
            ],
          ),
        )
      ],
    );

  }

}