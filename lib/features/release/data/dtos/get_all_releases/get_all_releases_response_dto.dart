import 'package:flutter_template/features/release/data/dtos/get_all_releases/release_response_dto.dart';

class GetAllReleasesListDto {
  
  final List<ReleaseResponseDto> features;

  GetAllReleasesListDto({required this.features});

  factory GetAllReleasesListDto.fromJson(List<dynamic> jsonList) {
    return GetAllReleasesListDto(
      features: jsonList.map((json) => ReleaseResponseDto.fromJson(json)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return features.map((feature) => feature.toJson()).toList();
  }
}
