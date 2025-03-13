import 'package:flutter_template/features/auth/domain/entities/role_entity.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';

import '../dtos/user_dto.dart';

class UserMapper {
  
  static UserEntity toEntity(UserDTO dto) {

    return UserEntity(
      id: dto.id,
      name: dto.name,
      email: dto.email, 
      role: Role.fromName(dto.role), 
      lastUpdate: dto.lastUpdate,
      roleName: dto.roleName
    );

  }

  static UserDTO toDTO(UserEntity entity) {
    return UserDTO(
      id: entity.id,
      name: entity.name,
      email: entity.email, 
      role: entity.role.name,
      lastUpdate: entity.lastUpdate,
      roleName: entity.roleName
    );
  }
}