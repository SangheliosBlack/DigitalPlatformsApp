import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/features/application/dtos/create_feature_request_dto.dart';
import 'package:flutter_template/features/features/application/dtos/create_feature_survey_dto.dart';
import 'package:flutter_template/features/features/application/dtos/update_feature_survey_request_dto.dart';
import 'package:flutter_template/features/features/data/data.dart';
import 'package:flutter_template/features/features/domain/domain.dart';

class FeaturesRepositoryImpl implements FeaturesRepository  {

  final FeaturesRemoteDataSource remoteDataSource;

  FeaturesRepositoryImpl({
    required this.remoteDataSource
  });
  
  @override
  Future<DataState<Map<String, FeatureEntity>>> fetchAllFeatures() async {

    final remoteResponse = await remoteDataSource.fetchAllFeatures();

    if(remoteResponse is DataSuccess){

      final responseToEntity = GetAllFeaturesListMapper.fromDtoList(dtoList: remoteResponse.data!);

      return DataSuccess(responseToEntity);

    }

    return DataFailed(remoteResponse.error!);

  }

  @override
  Future<DataState<FeatureEntity>> createFeature({required CreateFeatureRequestDto request}) async {

    final remoteResponse = await remoteDataSource.createFeature(request: request);

    if(remoteResponse is DataSuccess){

      final resposeToEntity = GetAllFeaturesMapper.fromDto(remoteResponse.data!);

      return DataSuccess(resposeToEntity);

    }

    return DataFailed(remoteResponse.error!);

  }

  @override
  Future<DataState<FeatureEntity>> createFeatureSurvey({required CreateFeatureSurveyRequestDto request}) async {

    final remoteResponse = await remoteDataSource.createFeatureSurvey(request: request);

    if(remoteResponse is DataSuccess){

      final resposeToEntity = GetAllFeaturesMapper.fromDto(remoteResponse.data!);

      return DataSuccess(resposeToEntity);

    }else{

      return DataFailed(remoteResponse.error!);

    }

  }

  @override
  Future<DataState<FeatureEntity>> updateFeatureSurvey({required UpdateFeatureSurveyRequestDto request}) async {
    
    final remoteResponse = await remoteDataSource.updateFeatureSurvey(request: request);

    if(remoteResponse is DataSuccess){

      final resposeToEntity = GetAllFeaturesMapper.fromDto(remoteResponse.data!);

      return DataSuccess(resposeToEntity);

    }else{

      return DataFailed(remoteResponse.error!);

    }

  }

} 