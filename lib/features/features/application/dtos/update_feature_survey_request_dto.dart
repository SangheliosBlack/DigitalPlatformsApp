import 'package:meta/meta.dart';

@immutable
class UpdateFeatureSurveyRequestDto {

  final String ratingFeature;
  final String surveyId;
  final String comment;

  const UpdateFeatureSurveyRequestDto({
    required this.ratingFeature,
    required this.surveyId,
    required this.comment
  });

   Map<String, dynamic> toJson() {
    return {
      "rating_feature": ratingFeature,
      "survey_id": surveyId,
      "comment": comment,
    };
  }

}