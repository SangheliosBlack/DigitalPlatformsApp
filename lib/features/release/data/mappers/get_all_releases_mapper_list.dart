import 'package:flutter_template/features/release/data/dtos/get_all_releases/get_all_releases_response_dto.dart';
import 'package:flutter_template/features/release/data/mappers/release_mapper.dart';
import 'package:flutter_template/features/release/domain/entities/release_entity.dart';

class GetAllReleasesListMapper {

  static Map<String, ReleaseEntity> fromDtoList({required GetAllReleasesListDto dtoList}) {

    return {
      for (var dto in dtoList.features) dto.id : ReleaseMapper.fromDto(dto: dto),
    };

  }

}
