import 'package:flutter_template/features/release/data/dtos/get_all_releases/release_response_dto.dart';
import 'package:flutter_template/features/release/domain/entities/release_entity.dart';
import 'package:flutter_template/features/shared/data/mappers/features/user_feature_mapper.dart';

class ReleaseMapper {

  static ReleaseEntity fromDto({required ReleaseResponseDto dto}){

    return ReleaseEntity(
      title: dto.title, 
      description: dto.description, 
      imageUrl: dto.imageUrl, 
      user: UserFeatureMapper.fromDto(userDto: dto.user), 
      createdAt: dto.createdAt, 
      updatedAt: dto.updatedAt, 
      id: dto.id,
      quarter: dto.quarter,
      commercialFigure: dto.commercialFigure
    );

  }

}