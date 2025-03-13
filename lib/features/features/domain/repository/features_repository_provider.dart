import 'package:flutter_template/features/features/data/data.dart';
import 'package:flutter_template/features/features/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final featuresRepositoryProvider = Provider<FeaturesRepository>((ref){

  final featuresRemoteDataSource = ref.watch(featureRemoteDataSourceProvider);

  return FeaturesRepositoryImpl(
    remoteDataSource: featuresRemoteDataSource
  );

});