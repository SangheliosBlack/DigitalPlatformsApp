import 'package:meta/meta.dart';

@immutable
class CreateFeatureSurveyRequestDto {

  final String ratingFeature;
  final String feature;
  final String comment;

  const CreateFeatureSurveyRequestDto({
    required this.ratingFeature,
    required this.feature,
    required this.comment
  });

   Map<String, dynamic> toJson() {
    return {
      "rating_feature": ratingFeature,
      "feature": feature,
      "comment": comment,
    };
  }

}