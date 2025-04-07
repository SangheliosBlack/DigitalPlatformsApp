class CommercialFigureEntity {
  final String id;
  final String name;
  bool active;

  CommercialFigureEntity({
    required this.id,
    required this.name,
    required this.active,
  });

  CommercialFigureEntity copyWith({
    String? id,
    String? name,
    bool? active,
  }) {
    return CommercialFigureEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
    );
  }
}