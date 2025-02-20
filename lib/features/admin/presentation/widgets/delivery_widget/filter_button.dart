import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/constants/ui_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterButton extends StatelessWidget {

  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey.withAlpha(20),
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        spacing: 5,
        children: [
          Icon(
            BootstrapIcons.filter_circle,
            color: Colors.black.withAlpha(200),
            size: 11,
          ),
          Text(
              UiConstants.filterButtonLabel,
              style:  GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 12
              ),
            )
        ],
      ),
    );

  }

}