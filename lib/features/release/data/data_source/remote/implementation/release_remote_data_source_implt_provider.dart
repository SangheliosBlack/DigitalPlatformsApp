import 'package:flutter_template/core/services/http_client/http_client_provider.dart';
import 'package:flutter_template/features/release/data/data_source/remote/implementation/release_remote_data_source_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final releaseRemoteDataSourceProvider = Provider<FeatureRemoteDataSourceImpl>((ref){

  final httpService = ref.read(httpClientServiceProvider);

  return FeatureRemoteDataSourceImpl(
    httpClientService: httpService
  );

});