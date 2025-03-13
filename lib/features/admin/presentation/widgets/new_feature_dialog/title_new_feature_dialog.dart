import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleNewFeatureDialog extends StatelessWidget {
  
  const TitleNewFeatureDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Crear Nuevo Registro',
      style: GoogleFonts.poppins(
        color: Colors.black.withValues(alpha: .7),
        fontSize: 22,
        fontWeight: FontWeight.w400
      ),
    );
  }
}