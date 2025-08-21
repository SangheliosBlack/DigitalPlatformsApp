import 'package:flutter_template/features/release/data/dtos/get_all_releases/release_code_version_dto.dart';
import 'package:flutter_template/features/release/domain/entities/release_version_code_entity.dart';

class ReleaseVersionCodeMapper {

  static ReleaseVersionCodeEntity fromDto({required ReleaseVersionCodeDto dto}) {
    return ReleaseVersionCodeEntity(
      id: dto.id,
      code: dto.code,
    );
  }
}
