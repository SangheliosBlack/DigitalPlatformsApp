import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/use_cases/use_cases.dart';

class FeaturesUseCases {

  final Ref ref;

  FeaturesUseCases({required this.ref});

  GetAllFeaturesUseCase get getAllFeatures => ref.read(getAllFeaturesUseCaseProvider);

  CreateFeatureUseCase get createFeature => ref.read(createFeatureUseCaseProvider);

  CreateFeatureSurveyUseCase get createFeatureSurvey => ref.read(createFeatureSurveyUseCaseProvider);

  UpdateFeatureUseCase get  updateFeatureSurvey => ref.read(updateFeatureSurveyUseCaseProvider);



}

final useCasesFeatures = Provider((ref) => FeaturesUseCases(ref: ref));