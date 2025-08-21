class ReleaseVersionCodeDto {

  final String id;
  final String code;

  ReleaseVersionCodeDto({
    required this.id,
    required this.code,
  });

  factory ReleaseVersionCodeDto.fromJson(Map<String, dynamic> json) {
    return ReleaseVersionCodeDto(
      id: json["id"] ?? "",
      code: json["code"] ?? "",
    );
  }

}