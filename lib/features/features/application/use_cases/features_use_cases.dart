import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/use_cases/update_feature/update_feature.dart';
import 'package:flutter_template/features/features/application/use_cases/update_feature/update_feature_provider.dart';
import 'package:flutter_template/features/features/application/use_cases/use_cases.dart';

class FeaturesUseCases {

  final Ref ref;

  FeaturesUseCases({required this.ref});

  GetAllFeaturesUseCase get getAllFeatures => ref.read(getAllFeaturesUseCaseProvider);

  CreateFeatureUseCase get createFeature => ref.read(createFeatureUseCaseProvider);

  CreateFeatureSurveyUseCase get createFeatureSurvey => ref.read(createFeatureSurveyUseCaseProvider);

  UpdateFeatureSurveyUseCase get  updateFeatureSurvey => ref.read(updateFeatureSurveyUseCaseProvider);

  UpdateFeature get updateFeature => ref.read(updateFeatureProvider);

}

final useCasesFeatures = Provider((ref) => FeaturesUseCases(ref: ref));