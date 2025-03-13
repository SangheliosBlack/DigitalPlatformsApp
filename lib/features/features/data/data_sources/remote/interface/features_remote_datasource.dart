import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/features/application/application.dart';
import 'package:flutter_template/features/features/data/dtos/get_features/get_all_features_dto.dart';

abstract interface class FeaturesRemoteDataSource {

  Future<DataState<GetAllFeaturesListDto>> fetchAllFeatures();
  Future<DataState<FeatureDto>> createFeature({required CreateFeatureRequestDto request});
  Future<DataState<FeatureDto>> createFeatureSurvey({required CreateFeatureSurveyRequestDto request});
  Future<DataState<FeatureDto>> updateFeatureSurvey({required UpdateFeatureSurveyRequestDto request});
  
}