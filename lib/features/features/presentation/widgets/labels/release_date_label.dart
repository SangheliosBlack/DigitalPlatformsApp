import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:flutter_template/core/core.dart';

class ReleaseDateLabel extends StatelessWidget {

  final DateTime createdAt;

  const ReleaseDateLabel({
    super.key,
    required this.createdAt
  });

  @override
  Widget build(BuildContext context) {

    return Text(
      DateTimeUtils.formatDateWithTime(createdAt),
      style: GoogleFonts.quicksand(
        fontSize: 13,
        color: Colors.black.withAlpha(160),
        fontWeight: FontWeight.w400
      ),
    );

  }

}