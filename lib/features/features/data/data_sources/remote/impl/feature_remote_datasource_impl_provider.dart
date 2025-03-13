import 'package:flutter_template/core/services/services.dart';
import 'package:flutter_template/features/features/data/data_sources/remote/impl/feature_remote_datasource_impl.dart';
import 'package:flutter_template/features/features/data/data_sources/remote/interface/features_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final featureRemoteDataSourceProvider = Provider<FeaturesRemoteDataSource>((ref){

  final httpClientService = ref.watch(httpClientServiceProvider);

  return FeatureRemoteDatasourceImpl(
    httpClientService: httpClientService
  );

});