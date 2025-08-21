//DataSource
import 'package:flutter_template/core/services/services.dart';
import 'package:flutter_template/features/version_codes/application/use_cases/get_all_version_codes.dart';
import 'package:flutter_template/features/version_codes/data/data_sources/remote/version_codes_remote_data_source.dart';
import 'package:flutter_template/features/version_codes/data/data_sources/remote/version_codes_remote_data_source_impl.dart';
import 'package:flutter_template/features/version_codes/data/repositories/version_codes_repository_impl.dart';
import 'package:flutter_template/features/version_codes/domain/repositories/version_codes_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final versionCodeRemoteDataSourceDi = Provider<VersionCodesRemoteDataSource>((ref) {

  final httpServide = ref.read(httpClientServiceProvider);
  
  return VersionCodesRemoteDataSourceImpl(httpClientService: httpServide);

});

//Repository

final versionCodeRepositoryDi = Provider<VersionCodesRepository>((ref) {

  final remoteDataSource = ref.read(versionCodeRemoteDataSourceDi);
  
  return VersionCodesRepositoryImpl(remoteDataSource: remoteDataSource);

});

//UseCase
final getAllVersionCodes = Provider<GetAllVersionCodes>((ref) {

  final repository = ref.read(versionCodeRepositoryDi);
  
  return GetAllVersionCodes(repository: repository);

});