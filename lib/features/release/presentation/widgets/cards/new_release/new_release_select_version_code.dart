import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/release/presentation/widgets/cards/new_release/new_release_verison_code_chip.dart';
import 'package:flutter_template/features/version_codes/presentation/providers/version_codes_provider.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class NewReleaseSelectVersionCode extends ConsumerWidget {

  const NewReleaseSelectVersionCode({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final versionCodes = ref.watch(versionCodesProvider).list;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          "Selecciona un codigo de version",
          style: GoogleFonts.quicksand(
          fontSize: 12,
          color: Colors.grey
          ),
        ),
        SizedBox(
          height: 35,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) { 
        
              final versionCode = versionCodes[index];
        
              return NewReleaseVerisonCodeChip(versionCode:versionCode);
        
            }, 
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_,__) => Gap(10), 
            itemCount: versionCodes.length
          ),
        ),
      ],
    );

  }

}