import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/providers/form_feature/edit_form_feature_notifier.dart';
import 'package:flutter_template/features/features/domain/entities/feature/feature_entity.dart';

import 'package:flutter_template/features/features/presentation/widgets/content/body_content_edit.dart';
import 'package:flutter_template/features/features/presentation/widgets/widgets.dart';

class EditSurveyFeatureDialog extends ConsumerStatefulWidget {
  final FeatureEntity feature;

  const EditSurveyFeatureDialog({super.key, required this.feature});

  @override
  ConsumerState<EditSurveyFeatureDialog> createState() =>
      _EditSurveyFeatureDialogState();
}

class _EditSurveyFeatureDialogState
    extends ConsumerState<EditSurveyFeatureDialog> {
  @override
  void initState() {
    super.initState();

    /// Usamos microtask para evitar llamar a ref.read en medio del build
    Future.microtask(() {
      ref.read(editFormFeatureProvider.notifier).updateDescription(widget.feature.description);
      ref.read(editFormFeatureProvider.notifier).updateTitle(widget.feature.title);
      ref.read(editFormFeatureProvider.notifier).updateVersionCode(value: widget.feature.versionCode.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 650,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FeatureSurveyCloseDialog(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      ReleaseDateLabel(
                        createdAt: widget.feature.createdAt,
                      ),
                      BodyContentEdit(
                        feature: widget.feature,
                      ),
                    ],
                  ),
                  UserCreateByLabel(
                    user: widget.feature.user,
                    feature: widget.feature,
                    showEdit: true,
                  ),
                  Row(
                    children: [
                      const FeatureSurveryButtonCancel(),
                      FeatureSurveryButtonConfirm(
                        feature: widget.feature,
                        edit: true,
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
