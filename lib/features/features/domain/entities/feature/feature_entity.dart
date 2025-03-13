
import 'package:flutter_template/features/features/domain/entities/feature/feature_answer_suvery_entity.dart';
import 'package:flutter_template/features/features/domain/entities/feature/list_improvements_entity.dart';
import 'package:flutter_template/features/shared/shared.dart';

class FeatureEntity {

  String id;
  String title;
  String description;
  int status;
  List<ListImprovementEntity> listImprovements;
  UserProfileEntity user;
  DateTime createdAt;
  DateTime updatedAt;
  int surveyQuantity;
  double surveyAverage;
  int surverMax;
  List<FeatureAnswerEntity> featureAnswers;
  AnswerSurveryEntity answerSurvey;

  FeatureEntity({
    required this.id,
    required this.title,
    required this.status,
    required this.listImprovements,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.surveyQuantity,
    required this.surveyAverage,
    required this.surverMax,
    required this.description,
    required this.featureAnswers,
    required this.answerSurvey
  });
  
}
