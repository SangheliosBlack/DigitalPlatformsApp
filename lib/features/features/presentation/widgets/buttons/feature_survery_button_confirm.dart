import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/providers/features_provider.dart';
import 'package:flutter_template/features/features/domain/entities/feature/feature_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';

class FeatureSurveryButtonConfirm extends ConsumerWidget {

  final FeatureEntity feature;

  const FeatureSurveryButtonConfirm({
    super.key,
    required this.feature
  });

  @override
  Widget build(BuildContext context,ref) {

    final isComplete = ref.watch(featuresProvider).isSurveyComplete;

    return GestureDetector(
      onTap: () async {

        if(!isComplete) return;

        if(feature.answerSurvey.answerComplete){
          await ref.read(featuresProvider.notifier).updateFeatureSurvey(surveyId:feature.answerSurvey.id);
        }else{
          await ref.read(featuresProvider.notifier).createFeatureSurvey(featureId:feature.id);
        }

        // ignore: use_build_context_synchronously
        context.pop();

      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 35
        ),
        decoration: BoxDecoration(
          color: isComplete ? AppTheme.primary : Colors.grey.withAlpha(150),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(
          feature.answerSurvey.answerComplete ? "Actulizar" :"Guardar" ,
          style: GoogleFonts.quicksand(
            color: isComplete ? Colors.white : Colors.black.withAlpha(100),
            fontWeight: FontWeight.w600,
            fontSize: 15
          ),
        ),
      ),
    );

  }
}