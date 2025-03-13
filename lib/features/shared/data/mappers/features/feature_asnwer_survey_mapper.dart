import 'package:flutter_template/features/features/data/dtos/dtos.dart';
import 'package:flutter_template/features/features/domain/entities/entities.dart';

class FeatureAsnwerSurveyMapper {

  static AnswerSurveryEntity fromDto({required FeatureAnswerSurveyDto dto}){

    return AnswerSurveryEntity(
      id: dto.id, 
      comment: dto.comment, 
      feature: dto.feature, 
      ratingFeature: dto.ratingFeature, 
      createdAt: dto.createdAt
    );

  }

}