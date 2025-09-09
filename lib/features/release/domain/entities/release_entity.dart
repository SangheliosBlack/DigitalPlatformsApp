import 'package:flutter_template/features/release/domain/entities/release_version_code_entity.dart';
import 'package:flutter_template/features/shared/shared.dart';

class ReleaseEntity {
  String title;
  String description;
  String? imageUrl;
  String? mediaUrl;
  UserProfileEntity user;
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  int quarter;
  String commercialFigure;
  VersionCodeMinEntity codeVersion;

  ReleaseEntity({
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
    required this.codeVersion
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'mediaUrl': mediaUrl,
      'user': user.toMap(), 
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'id': id,
      'quarter': quarter,
      'commercialFigure': commercialFigure,
      'codeVersion': codeVersion
    };
  }
}
