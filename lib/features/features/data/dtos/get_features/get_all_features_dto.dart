import 'package:flutter_template/features/features/data/dtos/get_features/get_all_features.dart';
import 'package:flutter_template/features/shared/shared.dart';

class FeatureDto {

  final String id;
  final String title;
  final String description;
  final int status;
  final List<ListImprovementsFeaturesDto> listImprovements;
  final UserFeatureDto user;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int surveyQuantity;
  final double surveyAverage;
  final int surveyMax;
  final List<FeatureAnswersDto> featureAnswersDto;
  final FeatureAnswerSurveyDto answerSurveyDto;
  final String commercialFigure;

  FeatureDto({
    required this.id,
    required this.title,
    required this.status,
    required this.listImprovements,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.surveyQuantity,
    required this.surveyAverage,
    required this.surveyMax,
    required this.description,
    required this.featureAnswersDto,
    required this.answerSurveyDto,
    required this.commercialFigure
  });

  factory FeatureDto.fromJson(Map<String, dynamic> json) {
    return FeatureDto(
      id: json["_id"] ?? "",
      title: json["title"] ?? "",
      status: json["status"] ?? 0,
      listImprovements: (json["list_improvements"] as List?)
              ?.map((x) => ListImprovementsFeaturesDto.fromJson(x))
              .toList() ??
          [],
      user: UserFeatureDto.fromJson(json["user"] ?? {}),
      createdAt: DateTime.tryParse(json["createdAt"] ?? "") ?? DateTime(1970),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? "") ?? DateTime(1970),
      surveyQuantity: json["survey_quantity"] ?? 0,
      surveyAverage: (json["survey_average"] as num?)?.toDouble() ?? 0.0,
      surveyMax: json["survey_max"] ?? 0,
      description: json["description"] ?? "", 
      featureAnswersDto: FeatureAnswersMapper.fromJsonList(json["answers"] ?? []), 
      answerSurveyDto: json["answer_survey"] != null 
          ? FeatureAnswerSurveyDto.fromJson(json["answer_survey"]) 
          : FeatureAnswerSurveyDto.defautlValue(), 
      commercialFigure: json["commercial_figure"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "title": title,
      "status": status,
      "list_improvements": listImprovements.map((x) => x.toJson()).toList(),
      "user": user.toJson(),
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "survey_quantity": surveyQuantity,
      "survey_average": surveyAverage,
      "survey_max": surveyMax,
    };
  }
}


class GetAllFeaturesListDto {
  
  final List<FeatureDto> features;

  GetAllFeaturesListDto({required this.features});

  factory GetAllFeaturesListDto.fromJson(List<dynamic> jsonList) {
    return GetAllFeaturesListDto(
      features: jsonList.map((json) => FeatureDto.fromJson(json)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return features.map((feature) => feature.toJson()).toList();
  }
}
