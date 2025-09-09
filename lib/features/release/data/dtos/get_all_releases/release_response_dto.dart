import 'package:flutter_template/features/release/data/dtos/get_all_releases/release_code_version_dto.dart';
import 'package:flutter_template/features/shared/data/dtos/features/user_feature_dto.dart';

class ReleaseResponseDto {

    String title;
    String description;
    String? imageUrl;
    String? mediaUrl;
    UserFeatureDto user;
    DateTime createdAt;
    DateTime updatedAt;
    String id;
    int quarter;
    String commercialFigure;
    VersionCodeMinDto versionCode;

    ReleaseResponseDto({
        required this.title,
        required this.description,
        required this.imageUrl,
        required this.mediaUrl,
        required this.user,
        required this.createdAt,
        required this.updatedAt,
        required this.id,
        required this.quarter,
        required this.commercialFigure,
        required this.versionCode
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
        versionCode: VersionCodeMinDto.fromJson(json["version_code"]), 
        mediaUrl: json["media_url"],
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
