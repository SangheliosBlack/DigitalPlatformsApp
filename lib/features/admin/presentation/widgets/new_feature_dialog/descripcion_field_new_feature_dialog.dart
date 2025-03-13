import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/providers/providers.dart';
import 'package:google_fonts/google_fonts.dart';

class DescripcionFieldNewFeatureDialog extends ConsumerWidget {

  const DescripcionFieldNewFeatureDialog({super.key});

  @override
  Widget build(BuildContext context,ref) {

    return TextField(
      style: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w300
      ),
      onChanged: (value) {
        
        ref.read(formProvider.notifier).updateDescription(value);

      },
      maxLines: 8,
      decoration: InputDecoration(
        hintText: "Descripción",
        hintStyle: GoogleFonts.roboto(
          color: Colors.grey.withAlpha(200),
          fontSize: 16.0,
          fontWeight: FontWeight.w300
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        fillColor: Colors.grey.withAlpha(0),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

  }

}