import 'package:dartz/dartz.dart';
import 'package:flutter_template/features/version_codes/domain/entities/version_code_entity.dart';
import 'package:flutter_template/features/version_codes/domain/repositories/version_codes_repository.dart';

class GetAllVersionCodes {

  final VersionCodesRepository repository;

  GetAllVersionCodes({required this.repository});

  Future<Either<String,List<VersionCodeEntity>>> call(){

    return repository.fetchAllVersionCodes();

  }

}