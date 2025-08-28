import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/auth/data/dtos/dtos.dart';
import 'package:flutter_template/features/auth/data/dtos/user_dto.dart';
import 'package:flutter_template/features/auth/domain/params/login_params.dart';

abstract interface class AuthRemoteDataSource {

  Future<DataState<UserLoginResponseDTO>> login({required LoginParams params});
  Future<Either<String,UserDTO>> userMe();
  Future<DataState<CommercialFiguresResponseDTO>> getAllCommercialFigues();
  
}