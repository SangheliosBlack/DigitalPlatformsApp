import 'package:flutter/material.dart';

import 'package:flutter_template/features/admin/presentation/widgets/survey_feature_dialog/list_improvements_widget.dart';
import 'package:flutter_template/features/features/domain/entities/feature/feature_entity.dart';
import 'package:flutter_template/features/features/presentation/widgets/widgets.dart';

class SurveyFeatureDialog extends StatelessWidget {

  final FeatureEntity feature;

  const SurveyFeatureDialog({
    super.key,
    required this.feature
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 650,
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FeatureSurveyCloseDialog(),
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
                  ListImprovementsWidget(
                    listImprovements: feature.listImprovements,
                  ),
                  UserCreateByLabel(
                    user: feature.user,
                  ),
                  FeatureImprovementList(
                    feature: feature,
                  ),
                  FeatureAnswerZone(
                    feature: feature
                  ),
                  Row(
                    children: [
                      FeatureSurveryButtonCancel(),
                      FeatureSurveryButtonConfirm(
                        feature: feature,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
  
}