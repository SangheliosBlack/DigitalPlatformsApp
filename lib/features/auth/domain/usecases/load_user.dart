import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/usecase/usecase.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_template/features/auth/domain/repository/auth_repository.dart';

class LoadUserCase implements Usecase<DataState<UserEntity>, Object> {

  final AuthRepository _authRepository;

  LoadUserCase(this._authRepository);
  
  @override
  Future<DataState<UserEntity>> execute({required Object params}) {
    
    return _authRepository.loadUser();
  }
 
}
