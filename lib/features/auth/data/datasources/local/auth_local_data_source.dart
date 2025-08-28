import 'package:dartz/dartz.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';

abstract interface class AuthLocalDataSource {
  
  Future<void> saveToken({required String token});
  Future<void> saveUser(UserEntity userData);
  Future<Either<String,UserEntity>> getCachedUser();
  
}