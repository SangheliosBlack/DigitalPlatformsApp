import 'package:flutter_template/features/auth/data/dtos/commercial_figure_dto.dart';
import 'package:flutter_template/features/auth/domain/entities/commercial_figure_entity.dart';

class CommercialFigureMapper {
  static List<CommercialFigureEntity> fromDtoList(List<CommercialFigureDto> dtos) {
    return dtos.map((dto) => CommercialFigureEntity(
      id: dto.id,
      name: dto.name,
      active: false
    )).toList();
  }
}
