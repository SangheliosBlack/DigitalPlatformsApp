import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/providers/features_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:flutter_template/features/shared/domain/entities/answer_entity.dart';
import 'package:flutter_template/core/core.dart';

class FeatureAnswerButton extends ConsumerWidget {

  final FeatureAnswerEntity answer; 

  const FeatureAnswerButton({
    super.key,
    required this.answer
  });

  @override
  Widget build(BuildContext context,ref) {

    final selectedFeatueId = ref.watch(featuresProvider).featureAnswerId;

    return GestureDetector(
      onTap: (){

        ref.read(featuresProvider.notifier).updateAnswerFeature(id: answer.id);

      },
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 100
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 20
        ),
        decoration: BoxDecoration(
          color: selectedFeatueId == answer.id ? AppTheme.primary : Colors.transparent,
          border: Border.all(
            width: 1,
            color: selectedFeatueId == answer.id ? AppTheme.primary : Colors.grey.withAlpha(200)
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(
            answer.title,
            style: GoogleFonts.quicksand(
              color: selectedFeatueId == answer.id ? Colors.white : Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );

  }
}