import 'package:dartz/dartz.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_template/features/auth/domain/repository/auth_repository.dart';

class LoadUserCase {

  final AuthRepository _authRepository;

  LoadUserCase(this._authRepository);
  
  Future<Either<String,UserEntity>> call() {
    
    return _authRepository.loadUser();
  }
 
}
