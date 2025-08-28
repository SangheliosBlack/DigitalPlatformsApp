import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/auth/data/datasources/data_sources.dart';
import 'package:flutter_template/features/auth/data/mappers/conmmercial_figure_mapper.dart';
import 'package:flutter_template/features/auth/data/mappers/login_user_response_mapper.dart';
import 'package:flutter_template/features/auth/data/mappers/user_mapper_response.dart';
import 'package:flutter_template/features/auth/domain/domain.dart';
import 'package:flutter_template/features/auth/domain/entities/commercial_figure_entity.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_template/features/auth/domain/params/login_params.dart';

class AuthRepositoryImpl implements AuthRepository {

  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource
  });

  @override
  Future<DataState<UserEntity>> login({required LoginParams params}) async {

    final remoteResponse = await remoteDataSource.login(params: params);

    if(remoteResponse is DataSuccess){

      final responseToEntity = LoginUserResponseMapper.toLoginUserEntity(remoteResponse.data!);

      await localDataSource.saveToken(token: responseToEntity.accessToken);

      await localDataSource.saveUser(responseToEntity.user);

      return DataSuccess(responseToEntity.user);

    }
    
    return DataFailed(remoteResponse.error!);
    
  }
  
  @override
  Future<Either<String,UserEntity>> loadUser() async {

    final localResponse = await localDataSource.getCachedUser();

    return localResponse.fold(
      (error)  async{

        final remoteUserMe = await remoteDataSource.userMe();

        return remoteUserMe.fold(
          (remoteError) => Left(remoteError),
          (remoteData) async {

            final userEntity = UserMapper.toEntity(remoteData);

            await localDataSource.saveUser(userEntity);

            return Right(userEntity);

          },
        );

      },
      (data) {

        return Right(data);

      } 
    );
    
  }

  @override
  Future<DataState<List<CommercialFigureEntity>>> getAllCommercialFigues() async {

    final remoteResponse = await remoteDataSource.getAllCommercialFigues();

    if(remoteResponse is DataSuccess){

      final responseToEntity = CommercialFigureMapper.fromDtoList(remoteResponse.data!.commercialFigures);

      return DataSuccess(responseToEntity);

    }
    
    return DataFailed(remoteResponse.error!);

  }

  @override
  Future<Either<String, UserEntity>> userMe() async {

    final remoteResponse = await remoteDataSource.userMe();

    return remoteResponse.fold(
      (error) => Left(error),
      (data) {

        final userEntity = UserMapper.toEntity(data);

        return Right(userEntity);

      },
    );

  }

}