import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/use_cases/create_feature_survey/create_feature_survey_use_case.dart';
import 'package:flutter_template/features/features/domain/repository/features_repository_provider.dart';

final createFeatureSurveyUseCaseProvider = Provider<CreateFeatureSurveyUseCase>((ref){

  final repository = ref.watch(featuresRepositoryProvider);

  return CreateFeatureSurveyUseCase(repository: repository);

});