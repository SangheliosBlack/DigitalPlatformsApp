class VersionCodeDto {

  final String code;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final bool current;

  VersionCodeDto({
    required this.code,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.current
  });

  factory VersionCodeDto.fromJson(Map<String, dynamic> json) {

    return VersionCodeDto(
      code: json['code'] ?? '',
      active: json['active'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      id: json['_id'] ?? '',
      current : json["current"]
    );

  }

  static List<VersionCodeDto> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => VersionCodeDto.fromJson(json)).toList();
  }
  
}
