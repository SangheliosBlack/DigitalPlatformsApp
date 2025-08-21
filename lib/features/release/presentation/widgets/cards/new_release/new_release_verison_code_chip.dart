import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/release/application/providers/form_release/form_release_notifier.dart';
import 'package:flutter_template/features/version_codes/domain/entities/version_code_entity.dart';
import 'package:google_fonts/google_fonts.dart';

class NewReleaseVerisonCodeChip extends ConsumerWidget {

  final VersionCodeEntity versionCode;

  const NewReleaseVerisonCodeChip({super.key, required this.versionCode});

  @override
  Widget build(BuildContext context,ref) {

    final selectedFormVersionCode = ref.watch(releaseFormProvider).versionCode;

    final isSelected = selectedFormVersionCode == versionCode.id;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          ref.read(releaseFormProvider.notifier).updateVersionCode(value: versionCode.id);
        },
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primary : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          duration: Duration(milliseconds: 200),
          child: Row(
            spacing: 10,
            children: [
              Icon(
                isSelected ? BootstrapIcons.rocket_takeoff_fill : BootstrapIcons.rocket_takeoff,
                color: !isSelected ? AppTheme.primary : Colors.white,
                size: 15,
              ),
                Text(
                  versionCode.code,
                  style: GoogleFonts.poppins(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w300
                  ),
                )
            ],
          ),
        ),
      ),
    );

  }
  
}