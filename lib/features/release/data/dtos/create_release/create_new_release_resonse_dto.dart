import 'package:flutter_template/features/release/data/dtos/get_all_releases/release_response_dto.dart';

class CreateNewReleaseResonseDto {

  final ReleaseResponseDto newRelease;

  CreateNewReleaseResonseDto({required this.newRelease});

  factory CreateNewReleaseResonseDto.fromJson({required Map<String, dynamic> jsonMap}) {

    return CreateNewReleaseResonseDto(
      newRelease: ReleaseResponseDto.fromJson(jsonMap)
    );

  }

}