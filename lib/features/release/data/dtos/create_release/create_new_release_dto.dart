import 'package:flutter_template/features/shared/data/dtos/features/user_feature_dto.dart';

class ReleaseDto {

    final String title;
    final String description;
    final int quarter;
    final String imageUrl;
    final UserFeatureDto user;
    final DateTime createdAt;
    final DateTime updatedAt;
    final String id;

    ReleaseDto({
      required this.title,
      required this.description,
      required this.quarter,
      required this.imageUrl,
      required this.user,
      required this.createdAt,
      required this.updatedAt,
      required this.id,
    });

      factory ReleaseDto.fromJson(Map<String, dynamic> json) => ReleaseDto(
        title: json["title"],
        description: json["description"],
        quarter: json["quarter"],
        imageUrl: json["image_url"],
        user: UserFeatureDto.fromJson(json["user"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["_id"],
    );
    
}