

import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/auth/domain/entities/entities.dart';
import 'package:flutter_template/features/auth/domain/params/login_params.dart';


abstract class AuthRepository {

  Future<DataState<UserEntity>> login({required LoginParams params});
  Future<DataState<UserEntity>> loadUser();
  Future<DataState<List<CommercialFigureEntity>>> getAllCommercialFigues();

}