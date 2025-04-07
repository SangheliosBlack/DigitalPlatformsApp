class CommercialFigureDto {
  final String id;
  final String name;

  CommercialFigureDto({
    required this.id,
    required this.name,
  });

  factory CommercialFigureDto.fromJson(Map<String, dynamic> json) {
    return CommercialFigureDto(
      id: json['_id'] as String,
      name: json['name'] as String,
    );
  }
}