import 'dart:io';
import 'dart:typed_data';

import 'package:meta/meta.dart';

@immutable
class CreateReleaseRequestDto {

  final String title;
  final String description;
  final int quarter;
  final File? file;
  final String commercialFigure;
  final Uint8List? fileBytes;
  final String? fileName;

  const CreateReleaseRequestDto({
    required this.title,
    required this.description,
    required this.quarter,
    this.file,
    this.fileBytes,
    required this.commercialFigure,
    this.fileName,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'quarter': quarter,
      'commercial_figure' : commercialFigure
    };
  }

}