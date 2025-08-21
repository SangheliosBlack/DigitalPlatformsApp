class VersionCodeEntity {

  final String code;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final bool current;

  VersionCodeEntity({
    required this.code,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.current
  });
  
}
