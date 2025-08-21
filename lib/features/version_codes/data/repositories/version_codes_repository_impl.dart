import 'package:dartz/dartz.dart';
import 'package:flutter_template/features/version_codes/data/data_sources/remote/version_codes_remote_data_source.dart';
import 'package:flutter_template/features/version_codes/data/mappers/version_codes_mapper.dart';
import 'package:flutter_template/features/version_codes/domain/entities/version_code_entity.dart';
import 'package:flutter_template/features/version_codes/domain/repositories/version_codes_repository.dart';

class VersionCodesRepositoryImpl implements VersionCodesRepository {

  final VersionCodesRemoteDataSource remoteDataSource;

  VersionCodesRepositoryImpl({required this.remoteDataSource});
  
  @override
  Future<Either<String, List<VersionCodeEntity>>> fetchAllVersionCodes() async {

    final remoteResponse = await remoteDataSource.fetchAllVersionCodes();

    return await remoteResponse.fold(
      (error){
        
        return Left(error);

      },
      (data){

        final dataMapped =  VersionCodesMapper.toEntityList(dtoList: data);

        return Right(dataMapped);

      });

  }

}