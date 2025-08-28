import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/providers/features_provider.dart';
import 'package:flutter_template/features/features/application/providers/form_feature/edit_form_feature_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class FeatureSurveryButtonCancel extends ConsumerWidget {

  const FeatureSurveryButtonCancel({super.key});

  @override
  Widget build(BuildContext context,ref) {

    return GestureDetector(
      onTap: (){

        ref.read(featuresProvider.notifier).resetFeatureSurver();
        ref.read(editFormFeatureProvider.notifier).resetForm();

        context.pop();

      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 25
        ),
        child: Text(
          "Cancelar",
          style: GoogleFonts.quicksand(
            color:  Colors.black.withAlpha(100),
            fontWeight: FontWeight.w500,
            fontSize: 15
          ),
        ),
      ),
    );

  }
}