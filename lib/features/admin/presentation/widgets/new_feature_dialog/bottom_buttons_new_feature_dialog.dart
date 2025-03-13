import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/features/application/providers/features_provider.dart';
import 'package:flutter_template/features/features/application/providers/form_feature/form_feature_notifier.dart';
import 'package:flutter_template/features/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class BottomButtonsNewFeatureDialog extends ConsumerWidget {

  final int status;
  
  const BottomButtonsNewFeatureDialog({
    super.key,
    required this.status
  });

  @override
  Widget build(BuildContext context,ref) {

    final formState = ref.watch(formProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SbButton(
          title: 'Cancelar',
          onTap: () {

            Navigator.pop(context);

            ref.read(formProvider.notifier).resetForm();

          },
        ),
        SbButton(
          color:  AppTheme.primary.withAlpha(formState.isValid ? 255 :50) ,
          borderRadius: BorderRadius.circular(100),
          textStyle: GoogleFonts.quicksand(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
          title: 'Guardar',
          onTap: () async { 

            if (!formState.isValid) return;

            await ref.read(featuresProvider.notifier).createFeature(status: status);

            Navigator.pop(context);

            ref.read(formProvider.notifier).resetForm();

          }, 
        )
      ],
    );
  }
}