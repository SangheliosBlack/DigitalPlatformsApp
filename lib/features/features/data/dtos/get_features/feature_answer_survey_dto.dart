class FeatureAnswerSurveyDto {

  String id;
  String comment;
  String feature;
  int ratingFeature;
  DateTime createdAt;

  FeatureAnswerSurveyDto({
    required this.id,
    required this.comment,
    required this.feature,
    required this.ratingFeature,
    required this.createdAt,
  });

  factory FeatureAnswerSurveyDto.fromJson(Map<String, dynamic> json) => FeatureAnswerSurveyDto(
    id: json["_id"],
    comment: json["comment"],
    feature: json["feature"],
    ratingFeature: json["rating_feature"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  factory FeatureAnswerSurveyDto.defautlValue() => FeatureAnswerSurveyDto(id: '', comment: '', feature: '', ratingFeature: 0, createdAt: DateTime.now());

}
