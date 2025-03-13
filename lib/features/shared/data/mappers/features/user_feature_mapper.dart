import 'package:flutter_template/features/shared/data/dtos/features/user_feature_dto.dart';
import 'package:flutter_template/features/shared/domain/entities/user_profile_entity.dart';

class UserFeatureMapper {

  static UserProfileEntity fromDto({required UserFeatureDto userDto}){

    return UserProfileEntity(
      id: userDto.id, 
      fullName: userDto.fullName, 
      imageUrl: userDto.imageUrl
    );
    
  }

}