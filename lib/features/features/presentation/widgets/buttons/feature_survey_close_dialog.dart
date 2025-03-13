import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/features/application/providers/features_provider.dart';

class FeatureSurveyCloseDialog extends ConsumerWidget {

  const FeatureSurveyCloseDialog({super.key});

  @override
  Widget build(BuildContext context,ref) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {

            ref.read(featuresProvider.notifier).resetFeatureSurver();
          
            Navigator.pop(context);
            
          },
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppTheme.primary,
              shape: BoxShape.circle
            ),
            child: Icon(
              BootstrapIcons.x,
              color: Colors.white,
            )
          ),
        ),
      ],
    );

  }

}