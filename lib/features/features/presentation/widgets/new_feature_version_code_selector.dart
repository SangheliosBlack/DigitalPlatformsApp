import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/presentation/widgets/buttons/new_feature_version_code_chip.dart';
import 'package:flutter_template/features/version_codes/presentation/providers/version_codes_provider.dart';
import 'package:gap/gap.dart';

class NewFeatureSelectVersionCode extends ConsumerWidget {

  const NewFeatureSelectVersionCode({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final versionCodes = ref.watch(versionCodesProvider).list;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        SizedBox(
          height: 35,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (BuildContext context, int index) { 
        
              final versionCode = versionCodes[index];
        
              return NewfeatureVerisonCodeChip(versionCode:versionCode);
        
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