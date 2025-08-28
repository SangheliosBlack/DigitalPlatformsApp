class VersionCodeMinDto {

  final String id;
  final String code;

  VersionCodeMinDto({
    required this.id,
    required this.code,
  });

  factory VersionCodeMinDto.fromJson(Map<String, dynamic> json) {
    return VersionCodeMinDto(
      id: json["_id"] ?? "",
      code: json["code"] ?? "",
    );
  }

}