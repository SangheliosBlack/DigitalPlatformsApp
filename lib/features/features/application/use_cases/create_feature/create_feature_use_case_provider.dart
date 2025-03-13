import 'package:flutter_template/features/features/application/use_cases/create_feature/create_feature_use_case.dart';
import 'package:flutter_template/features/features/domain/repository/features_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final createFeatureUseCaseProvider = Provider<CreateFeatureUseCase>((ref){

  final repository = ref.watch(featuresRepositoryProvider);

  return CreateFeatureUseCase(
    repository: repository
  );

});