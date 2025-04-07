import 'package:flutter_template/features/auth/data/dtos/dtos.dart';

class CommercialFiguresResponseDTO {

  final List<CommercialFigureDto> commercialFigures;

  CommercialFiguresResponseDTO({
    required this.commercialFigures,
  });

  factory CommercialFiguresResponseDTO.fromJson(List<dynamic> jsonList) {
  return CommercialFiguresResponseDTO(
    commercialFigures: jsonList.map((x) => CommercialFigureDto.fromJson(x)).toList(),
  );
}


}