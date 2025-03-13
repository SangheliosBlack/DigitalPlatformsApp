import 'package:hive/hive.dart';

part 'role_entity.g.dart';

@HiveType(typeId: 1)
class Role {
  
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String description;

  const Role(this.name, this.description);

  /// Instancias predefinidas como en un enum
  static const Role admin = Role('ADMIN', 'Administrator');
  static const Role user = Role('USER', 'User');

  /// Lista de valores posibles
  static const List<Role> values = [admin, user];

  /// Método para convertir desde String
  factory Role.fromName(String name) {
    return values.firstWhere((role) => role.name == name, orElse: () => user);
  }

  /// Conversión a JSON
  Map<String, dynamic> toJson() => {'name': name, 'description': description};

  /// Conversión desde JSON
  factory Role.fromJson(Map<String, dynamic> json) {
    return Role.fromName(json['name']);
  }

  @override
  String toString() => name;
}
