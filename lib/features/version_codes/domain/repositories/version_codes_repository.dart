import 'package:dartz/dartz.dart';
import 'package:flutter_template/features/version_codes/domain/entities/version_code_entity.dart';

abstract interface class VersionCodesRepository {

  Future<Either<String,List<VersionCodeEntity>>> fetchAllVersionCodes();

}