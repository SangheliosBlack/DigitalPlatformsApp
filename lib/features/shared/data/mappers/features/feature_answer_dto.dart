import 'package:flutter_template/features/features/data/dtos/get_features/feature_answer_dto.dart';
import 'package:flutter_template/features/shared/domain/entities/answer_entity.dart';

class FeatureAnswersMapper {

  static FeatureAnswersDto fromJson(Map<String, dynamic> json) {
    return FeatureAnswersDto(
      id: json["_id"],
      title: json["title"],
      active: json["active"],
      value: json["value"],
    );
  }

  static List<FeatureAnswersDto> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => fromJson(json)).toList();
  }

  static List<FeatureAnswerEntity> toEntityList({required List<FeatureAnswersDto> dtoList}) {

    return dtoList.map((dto) {

      return FeatureAnswerEntity(
        id: dto.id, 
        title: dto.title, 
        active: dto.active, 
        value: dto.value
      );

    }).toList();

  }
  
}
