import 'package:flutter_template/features/version_codes/data/dtos/version_code_dto.dart';
import 'package:flutter_template/features/version_codes/domain/entities/entitites.dart';

class VersionCodesMapper {

  static VersionCodeEntity _toEntity({required VersionCodeDto dto}){

    return VersionCodeEntity(
      code: dto.code, 
      active: dto.active, 
      createdAt: dto.createdAt, 
      updatedAt: dto.updatedAt, 
      id: dto.id, 
      current: dto.current
    );

  }

  static List<VersionCodeEntity> toEntityList({required List<VersionCodeDto> dtoList }){

    return dtoList.map((dto){

    return _toEntity(dto: dto);

    }).toList();

  }

}