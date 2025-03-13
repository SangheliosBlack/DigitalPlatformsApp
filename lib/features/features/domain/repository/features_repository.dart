import 'package:flutter_template/features/features/application/application.dart';
import 'package:flutter_template/features/features/domain/domain.dart';
import 'package:flutter_template/core/resources/data_state.dart';

abstract class FeaturesRepository {

  Future<DataState<Map<String, FeatureEntity>>>  fetchAllFeatures();
  Future<DataState<FeatureEntity>> createFeature({required CreateFeatureRequestDto request});
  Future<DataState<FeatureEntity>> createFeatureSurvey({required CreateFeatureSurveyRequestDto request});
  Future<DataState<FeatureEntity>> updateFeatureSurvey({required UpdateFeatureSurveyRequestDto request});

}