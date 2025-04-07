import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/auth/data/dtos/dtos.dart';
import 'package:flutter_template/features/auth/domain/params/login_params.dart';

abstract interface class AuthRemoteDataSource {

  Future<DataState<UserLoginResponseDTO>> login({required LoginParams params});

  Future<DataState<UserLoginResponseDTO>> refreshToken();

  Future<DataState<CommercialFiguresResponseDTO>> getAllCommercialFigues();
  
}