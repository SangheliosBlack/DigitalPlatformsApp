
import 'package:flutter_template/features/auth/presentation/providers/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_template/core/core.dart';

import 'package:flutter_template/features/features/application/application.dart';
import 'package:flutter_template/features/features/domain/domain.dart';

part 'features_provider.g.dart';

@Riverpod(keepAlive: true)
class Features extends _$Features{

  @override
  FeaturesState build() {

    return FeaturesState();
    
  }

  FeaturesUseCases get useCases => ref.read(useCasesFeatures);

  Future<void> fetchAllFeatures() async {

    await Future.delayed(Duration(seconds: 2));

    final response = await useCases.getAllFeatures.execute();

    if(response is DataSuccess){

      state = state.copyWith(features: response.data);

    }

  }

  Future<void> createFeatureSurvey ({required String featureId }) async {

    final requestDto = CreateFeatureSurveyRequestDto(
      ratingFeature: state.featureAnswerId, 
      feature: featureId, 
      comment: state.comment 
    );

    final response = await useCases.createFeatureSurvey.execute(request: requestDto);

    if(response is DataSuccess){

      final updatedMap = Map<String, FeatureEntity>.from(state.features);

      updatedMap[response.data!.id] = response.data!; 

      state = state.copyWith(features: updatedMap);
      

    }

    resetFeatureSurver();
    
  }

   Future<void> updateFeatureSurvey ({required String surveyId }) async {

    final requestDto = UpdateFeatureSurveyRequestDto(
      ratingFeature: state.featureAnswerId, 
      comment: state.comment, 
      surveyId: surveyId
    );

    final response = await useCases.updateFeatureSurvey.execute(request: requestDto);

    if(response is DataSuccess){

      final updatedMap = Map<String, FeatureEntity>.from(state.features);

      updatedMap[response.data!.id] = response.data!; 

      state = state.copyWith(features: updatedMap);
      

    }

    resetFeatureSurver();
    
  }

  Future<void> createFeature ({required int status}) async {

    final formFeatureState = ref.read(formProvider);

    final commercialFigureSelected = ref.read(authProvider).commercialFigureIdSelected;

    final CreateFeatureRequestDto request = CreateFeatureRequestDto(
      title: formFeatureState.title ,
      description: formFeatureState.description,
      status: status,
      listImprovements: formFeatureState.improvements,
      commercialFigure:commercialFigureSelected
    );

    final response = await useCases.createFeature.execute(request: request);

    final newFeature = response.data;

    if(response is DataSuccess){

      final List<MapEntry<String, FeatureEntity>> featureList = [
        MapEntry(newFeature!.id, newFeature),
        ...state.features.entries, 
      ];
  
      final updatedFeatures = Map<String, FeatureEntity>.fromEntries(featureList);
        
      state = state.copyWith(features: updatedFeatures);

    }

  }

  updateAnswerFeature ({required String id}) => state = state.copyWith(featureAnswerId: id);

  updateCommentFeatureSurver ({required String value }) => state = state.copyWith(comment: value);

  resetFeatureSurver () => state = state.copyWith(featureAnswerId:"",comment: "");

}