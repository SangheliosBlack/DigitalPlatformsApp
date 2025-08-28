import 'package:flutter_template/features/release/data/dtos/get_all_releases/release_code_version_dto.dart';
import 'package:flutter_template/features/release/domain/entities/release_version_code_entity.dart';

class VersionCodeMinMapper {

  static VersionCodeMinEntity fromDto({required VersionCodeMinDto dto}) {
    return VersionCodeMinEntity(
      id: dto.id,
      code: dto.code,
    );
  }
}
