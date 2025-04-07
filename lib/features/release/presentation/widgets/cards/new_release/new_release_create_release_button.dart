import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/release/application/providers/providers.dart';
import 'package:flutter_template/features/release/application/providers/releases_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class NewReleaseCreateReleaseButton extends ConsumerWidget {

  const NewReleaseCreateReleaseButton({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final releaseFormState = ref.watch(releaseFormProvider);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){

        if(!releaseFormState.isValid) return;

        ref.read(releasesProvider.notifier).createNewRelease();

      },
      child:AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: releaseFormState.isValid ? 1 : .2,
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(15)
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15
          ),
          child: Center(
            child: Text(
              "Crear liberacion",
              style: GoogleFonts.quicksand(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ),
      ),
    );

  }

}