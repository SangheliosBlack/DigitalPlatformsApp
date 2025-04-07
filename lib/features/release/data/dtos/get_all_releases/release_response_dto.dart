import 'package:flutter_template/features/shared/data/dtos/features/user_feature_dto.dart';

class ReleaseResponseDto {

    String title;
    String description;
    String imageUrl;
    UserFeatureDto user;
    DateTime createdAt;
    DateTime updatedAt;
    String id;
    int quarter;
    String commercialFigure;

    ReleaseResponseDto({
        required this.title,
        required this.description,
        required this.imageUrl,
        required this.user,
        required this.createdAt,
        required this.updatedAt,
        required this.id,
        required this.quarter,
        required this.commercialFigure
    });

    factory ReleaseResponseDto.fromJson(Map<String, dynamic> json) => ReleaseResponseDto(
        title: json["title"],
        description: json["description"],
        imageUrl: json["image_url"],
        user: UserFeatureDto.fromJson(json["user"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["_id"], 
        quarter: json["quarter"], 
        commercialFigure: json["commercial_figure"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "image_url": imageUrl,
        "user": user.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id_": id,
    };
}
