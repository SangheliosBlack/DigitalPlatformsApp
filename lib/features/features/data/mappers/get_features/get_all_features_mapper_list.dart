import 'package:flutter_template/features/features/data/dtos/dtos.dart';
import 'package:flutter_template/features/features/data/mappers/get_features/get_all_features_mapper.dart';
import 'package:flutter_template/features/features/domain/entities/feature/feature_entity.dart';

class GetAllFeaturesListMapper {

  static Map<String, FeatureEntity> fromDtoList({required GetAllFeaturesListDto dtoList}) {

    return {
      for (var dto in dtoList.features) dto.id : GetAllFeaturesMapper.fromDto(dto),
    };

  }

}
