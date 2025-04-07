import 'package:flutter_template/features/features/domain/entities/feature/feature_entity.dart';

class FeaturesState {

  final Map<String, FeatureEntity> features;
  final String featureAnswerId;
  final String comment;
  final bool showErrors;

  FeaturesState({
    this.features = const {},
    this.featureAnswerId = "",
    this.comment = "",
    this.showErrors = false
  });

  Map<String, FeatureEntity> getFeaturesByStatus({required int status,required String commercialFigure}) {

    if (features.isEmpty) return {};

    return Map.fromEntries(
      features.entries.where((entry) => entry.value.status == status && entry.value.commercialFigure == commercialFigure),
    );

  }

  bool get isSurveyComplete {

    return featureAnswerId.isNotEmpty && comment.isNotEmpty;

  }

  List<String> get surveyErrors{

    List<String> errors = [];

    if(comment.isEmpty){

      errors.add("Es requerido un comentario");

    }

    if(featureAnswerId.isEmpty){

      errors.add("Es requerido una valoracion");

    }

    return errors;

  }

  FeaturesState copyWith({
    Map<String, FeatureEntity>? features,
    String? featureAnswerId,
    String? comment,
    bool? showErrors
  }) {
    return FeaturesState(
      features: features ?? this.features,
      featureAnswerId: featureAnswerId ?? this.featureAnswerId,
      comment : comment ?? this.comment,
      showErrors : showErrors ?? this.showErrors
    );
  }
}