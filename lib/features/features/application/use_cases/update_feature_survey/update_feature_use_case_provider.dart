import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/use_cases/update_feature_survey/update_feature_use_case.dart';
import 'package:flutter_template/features/features/domain/domain.dart';
import 'package:flutter_template/features/features/domain/repository/features_repository_provider.dart';

final updateFeatureSurveyUseCaseProvider = Provider<UpdateFeatureUseCase>((ref){

  final FeaturesRepository repository = ref.watch(featuresRepositoryProvider);

  return UpdateFeatureUseCase(
    repository: repository
  );

});