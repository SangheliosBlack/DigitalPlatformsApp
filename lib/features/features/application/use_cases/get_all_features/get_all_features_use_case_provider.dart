import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/use_cases/get_all_features/get_all_features_use_case.dart';
import 'package:flutter_template/features/features/domain/repository/features_repository.dart';
import 'package:flutter_template/features/features/domain/repository/features_repository_provider.dart';

final getAllFeaturesUseCaseProvider = Provider<GetAllFeaturesUseCase>((ref){

  final FeaturesRepository repository = ref.watch(featuresRepositoryProvider);

  return GetAllFeaturesUseCase(
    repository: repository
  );

});