import 'package:flutter_template/features/shared/shared.dart';

class ReleaseEntity {
  String title;
  String description;
  String imageUrl;
  UserProfileEntity user;
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  int quarter;
  String commercialFigure;

  ReleaseEntity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.quarter,
    required this.commercialFigure,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'user': user.toMap(), 
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'id': id,
      'quarter': quarter,
      'commercialFigure': commercialFigure,
    };
  }
}
