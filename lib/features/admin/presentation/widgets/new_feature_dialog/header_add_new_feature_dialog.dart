import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/config.dart';
import 'package:flutter_template/features/features/application/providers/form_feature/form_feature.dart';


class HeaderAddNewFeature extends ConsumerWidget {

  const HeaderAddNewFeature({super.key});

  @override
  Widget build(BuildContext context,ref) {
    

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.primary.withAlpha(20)
          ),
          child: Icon(
            BootstrapIcons.rocket_fill,
            color: AppTheme.primary,
            size: 17,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {

            Navigator.pop(context);

            ref.read(formProvider.notifier).resetForm();

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
        )
      ],
    );

  }

}