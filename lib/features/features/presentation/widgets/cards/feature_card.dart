import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/providers/features_provider.dart';
import 'package:flutter_template/features/features/presentation/views/survey_feature_dialog.dart';
import 'package:flutter_template/features/features/domain/domain.dart';
import 'package:flutter_template/features/features/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/shared/domain/entities/entities.dart';
import 'package:flutter_template/features/shared/presentation/utils/show_customd_dialog.dart';

class FeatureCard extends ConsumerWidget {

  final FeatureEntity feature;

  const FeatureCard({
    super.key,
    required this.feature
  });

  @override
  Widget build(BuildContext context,ref) {

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){

        ref.read(featuresProvider.notifier).updateAnswerFeature(id: feature.featureAnswers.firstWhere((f)=> f.value == feature.answerSurvey.ratingFeature,orElse: () => FeatureAnswerEntity(id: "", title: "", active: false, value: 0),).id);
        ref.read(featuresProvider.notifier).updateCommentFeatureSurver(value: feature.answerSurvey.comment);


        CustomDialogService.showAlertDialog(
          context: context, 
          content: SurveyFeatureDialog(
            feature:feature
        ));

      },
      child: Stack(
        children: [
          Positioned(
            right: 5,
            child: Visibility(
              visible: feature.answerSurvey.ratingFeature != 0 ,
              child: Icon(
                BootstrapIcons.bookmark_check_fill,
                size: 40,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: Colors.grey.withAlpha(20)
              )
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReleaseDateLabel(
                            createdAt: feature.createdAt,
                          ),
                          BodyContent(
                            feature: feature,
                          ),
                        ],
                      ),
                      Spacer(),
                      UserCreateByLabel(
                        user: feature.user,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }

}