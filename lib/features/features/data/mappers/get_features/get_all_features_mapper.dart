import 'package:flutter_template/features/features/domain/domain.dart';
import 'package:flutter_template/features/features/data/data.dart';
import 'package:flutter_template/features/shared/shared.dart';

class GetAllFeaturesMapper {
  
  static FeatureEntity fromDto(FeatureDto dto) {

    return FeatureEntity(
      id: dto.id,
      title: dto.title,
      status: dto.status,
      listImprovements: dto.listImprovements.map((improvement) => ListImprovementsFeaturesMapper.fromDto(improvement: improvement)).toList(),
      user: UserFeatureMapper.fromDto(userDto: dto.user),
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      surveyQuantity: dto.surveyQuantity,
      surveyAverage: dto.surveyAverage,
      surverMax: dto.surveyMax,
      description: dto.description, 
      featureAnswers: FeatureAnswersMapper.toEntityList(dtoList: dto.featureAnswersDto), 
      answerSurvey: FeatureAsnwerSurveyMapper.fromDto(dto: dto.answerSurveyDto)
    );
    
  }

}
