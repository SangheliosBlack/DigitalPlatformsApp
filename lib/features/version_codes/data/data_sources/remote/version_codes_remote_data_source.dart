import 'package:dartz/dartz.dart';
import 'package:flutter_template/features/version_codes/data/dtos/version_code_dto.dart';

abstract interface class VersionCodesRemoteDataSource {

  Future<Either<String,List<VersionCodeDto>>> fetchAllVersionCodes();

}