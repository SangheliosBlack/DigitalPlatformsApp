import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/providers/form_feature/form_feature_notifier.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleFieldNewFeatureDialog extends ConsumerWidget {

  const TitleFieldNewFeatureDialog({super.key});

  @override
  Widget build(BuildContext context,ref) {

    return TextField(
      style: GoogleFonts.lora(
        color: Colors.black,
        fontSize: 27.0,
        fontWeight: FontWeight.bold
      ),
      onChanged: (value) {
        
        ref.read(formProvider.notifier).updateTitle(value);

      },
      decoration: InputDecoration(
        hintText: "Titulo",
        hintStyle: GoogleFonts.lora(
          color: Colors.grey.withAlpha(200),
          fontSize: 27.0,
          fontWeight: FontWeight.bold
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

