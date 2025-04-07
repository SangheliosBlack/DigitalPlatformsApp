import 'package:flutter_template/features/release/data/data_source/remote/implementation/implementation.dart';
import 'package:flutter_template/features/release/data/repository/release_repository_impl.dart';
import 'package:flutter_template/features/release/domain/repository/release_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final releaseRepositoyProvider = Provider<ReleaseRepository>((ref){

  final releasesRemoteDataSource = ref.read(releaseRemoteDataSourceProvider);

  return ReleaseRepositoryImpl(
    remoteDataSource: releasesRemoteDataSource
  );

});