import 'package:flutter_template/features/auth/domain/entities/role_entity.dart';
import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final Role role;

  @HiveField(4)
  final DateTime lastUpdate;

  @HiveField(5, defaultValue: "USER")
  final String roleName;

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.lastUpdate,
    required this.roleName,
  });

  UserEntity copyWith({
    String? id,
    String? email,
    String? name,
    String? lastName,
    Role? role,
    DateTime? lastUpdate,
    String? roleName
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      roleName: roleName ?? this.roleName
    );
  }
}
